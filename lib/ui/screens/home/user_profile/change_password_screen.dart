import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

import '../../../../widgets/common_widget/common_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  String errorMessage = '';
  bool passwordVisible = false;
  bool newpasswordVisible = false;
  Future<void> _showpassword() async {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Future<void> _shownewpassword() async {
    setState(() {
      newpasswordVisible = !newpasswordVisible;
    });
  }

  void _changePassword() async {
    if (formKey.currentState!.validate()) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        final uid = user!.uid;
        final credential = EmailAuthProvider.credential(
          email: user.email as String,
          password: currentPassword.text,
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword.text);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text('Success'),
            content: const Text('Your password has been changed.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'OK',
                  style: regularTextStyle(
                      color: ColorManager.darkblue, fontSize: 13.sp),
                ),
              ),
            ],
          ),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.darkblue,
        title: const Text('Change Password'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFeild(
                obscureText: !passwordVisible,
                maxLines: 1,
                controller: currentPassword,
                validator: Validator.passValidator,
                hintText: 'Current Password',
                labelText: 'Current Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager.searchiconcolor,
                  ),
                  onPressed: () => _showpassword(),
                ),
              ),
              buildSizedBoxSpacer(height: 15.h),
              CustomTextFeild(
                obscureText: !newpasswordVisible,
                maxLines: 1,
                controller: newPassword,
                validator: Validator.passValidator,
                hintText: 'New Password',
                labelText: 'New Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    newpasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: ColorManager.searchiconcolor,
                  ),
                  onPressed: () => _shownewpassword(),
                ),
              ),
              buildSizedBoxSpacer(height: 40.h),
              MaterialButton(
                height: 40.h,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () => _changePassword(),
                color: ColorManager.darkblue,
                child: Text('Save',
                    style: regularTextStyle(
                        fontSize: 16.sp, color: ColorManager.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
