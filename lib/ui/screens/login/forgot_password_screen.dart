import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';

import '../../../services/auth_services.dart';

class ForfotPasswordScreen extends StatelessWidget {
  const ForfotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final fromKey = GlobalKey<FormState>();
    final AuthServices auth = AuthServices();

    Future<void> _resetPassword() async {
      if (fromKey.currentState!.validate()) {
        auth.resetpassword(email: emailcontroller.text);
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.darkblue,
          title: Text(
            'Reset Password',
            style: regularTextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: ColorManager.white),
          )),
      body: Form(
        key: fromKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            children: [
              CustomTextFeild(
                obscureText: false,
                controller: emailcontroller,
                labelText: StringManager.enteremail,
                hintText: StringManager.enteremail,
                validator: Validator.emailValidator,
              ),
              SizedBox(
                height: 20.h,
              ),
              MaterialButton(
                height: 40.h,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r)),
                onPressed: () => _resetPassword(),
                color: ColorManager.darkblue,
                child: Text(
                  'Reset Password',
                  style: regularTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
