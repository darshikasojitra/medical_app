import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/home/user_profile/change_password_screen.dart';
import 'package:medical_app/ui/screens/login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List _icons = [
    Icon(
      Icons.settings_sharp,
      color: ColorManager.settingiconcolor,
      size: 25.sp,
    ),
    Icon(
      Icons.privacy_tip,
      color: ColorManager.settingiconcolor,
      size: 25.sp,
    ),
    Icon(
      Icons.payment_sharp,
      color: ColorManager.settingiconcolor,
      size: 25.sp,
    ),
    Icon(
      Icons.lock,
      color: ColorManager.settingiconcolor,
      size: 25.sp,
    )
  ];
  final List _textlist = [
    StringManager.accountsettings,
    StringManager.privacypolicy,
    StringManager.paymentmethod,
    'Change Password'
  ];
  Future<void> serviceMethod(index) async {
      if (index == 3) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen(),));
      } 
    }
  Future<void> _signout() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
    }
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.id, (route) => false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkblue,
      body: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 45.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 38.h,
                width: 42.w,
                decoration: BoxDecoration(
                    color: ColorManager.darkblue,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ColorManager.bordercolor)),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      AssetsManager.arrowimage,
                      color: ColorManager.white,
                    )),
              ),
            ),
            buildSizedBoxSpacer(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(Icons.account_circle_rounded,size: 70.sp,color: ColorManager.white,),
                  //Image.asset(AssetsManager.profilepageimage),
                  buildSizedBoxSpacer(height: 10.h),
                  Text(
                     //"${user?.displayName}",
                    StringManager.sahinalam,
                    style: regularTextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.white),
                  ),
                  Text(
                    StringManager.uidesigner,
                    style: regularTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.white),
                  )
                ],
              ),
            ),
            buildSizedBoxSpacer(
              height: 15.h,
            ),
            Column(
              children: [
                SizedBox(
                  height: 350.h,
                  width: 335.w,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => serviceMethod(index),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Container(
                            height: 55.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  _icons[index],
                                  buildSizedBoxSpacer(
                                    width: 15.w,
                                  ),
                                  Text(
                                    _textlist[index],
                                    style: regularTextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.darkblack),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90.w, top: 27.h),
                  child: GestureDetector(
                    onTap: () => _signout(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: ColorManager.logoutcolor,
                          size: 28.sp,
                        ),
                        buildSizedBoxSpacer(
                          width: 20.w,
                        ),
                        Text(
                          StringManager.logout,
                          style: regularTextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.logoutcolor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
