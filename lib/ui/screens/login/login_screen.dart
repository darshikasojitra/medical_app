import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/dashboard_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginfromKey = GlobalKey<FormState>();
  final _signupfromKey = GlobalKey<FormState>();
  bool _isSignup = true;
  bool _isaMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgcolor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                color: ColorManager.darkblue,
                child: Padding(
                  padding: EdgeInsets.only(top: 60.h, left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isSignup
                            ? StringManager.welcome
                            : StringManager.welcomeback,
                        style: regularTextStyle(
                            fontSize: 25.sp,
                            color: ColorManager.darkyellow,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        _isSignup
                            ? StringManager.signuptocontinue
                            : StringManager.logintocontinue,
                        style: regularTextStyle(
                            fontSize: 14.sp,
                            color: ColorManager.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _bottomContainer(
              true, _isSignup, context, _loginfromKey, _signupfromKey),
          AnimatedPositioned(
            duration: const Duration(microseconds: 700),
            curve: Curves.bounceInOut,
            top: 180.h,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 700),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: _isSignup ? 360.h : 260.h,
              width: 320.w,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //login and signup
                    _loginandsignup(),
                    //Sign up
                    if (_isSignup) _signupScreen(),
                    //Login
                    if (!(_isSignup)) _loginSCreen(),
                  ],
                ),
              ),
            ),
          ),
          _bottomContainer(
              false, _isSignup, context, _loginfromKey, _signupfromKey),
          _orSignupWith(_isSignup),
        ],
      ),
    );
  }

  Widget _loginandsignup() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isSignup = false;
              });
            },
            child: Column(
              children: [
                Text(
                  StringManager.login,
                  style: regularTextStyle(
                      fontSize: 16.sp,
                      color: !(_isSignup)
                          ? ColorManager.darkblue
                          : ColorManager.settingiconcolor,
                      fontWeight: FontWeight.w700),
                ),
                if (!(_isSignup))
                  Container(
                    height: 2.h,
                    width: 45.w,
                    color: ColorManager.darkyellow,
                  )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isSignup = true;
              });
            },
            child: Column(
              children: [
                Text(
                  StringManager.signup,
                  style: regularTextStyle(
                      fontSize: 16.sp,
                      color: _isSignup == true
                          ? ColorManager.darkblue
                          : ColorManager.settingiconcolor,
                      fontWeight: FontWeight.w700),
                ),
                if (_isSignup)
                  Container(
                    height: 2.h,
                    width: 55.w,
                    color: ColorManager.darkyellow,
                  )
              ],
            ),
          )
        ],
      );

  Widget _loginSCreen() => Container(
        margin: EdgeInsets.only(top: 25.h),
        child: Form(
          key: _loginfromKey,
          child: Column(
            children: [
              CustomTextFeild(
                  obscureText: false,
                  hintText: StringManager.enteremail,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: ColorManager.schedulecolor,
                  ),
                  validator: Validator.emailValidator),
              buildSizedBoxSpacer(height: 14.h),
              CustomTextFeild(
                  obscureText: true,
                  hintText: StringManager.enterpassword,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: ColorManager.schedulecolor,
                  ),
                  validator: Validator.passValidator),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        StringManager.forgotpassword,
                        style: regularTextStyle(
                            color: ColorManager.symptomscolor, fontSize: 12.sp),
                      )))
            ],
          ),
        ),
      );
  Widget _signupScreen() => Container(
        margin: EdgeInsets.only(top: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: 400.h,
            child: Form(
              key: _signupfromKey,
              child: Column(
                children: [
                  CustomTextFeild(
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: ColorManager.schedulecolor,
                      ),
                      hintText: StringManager.enterusername,
                      validator: Validator.nameValidator),
                  buildSizedBoxSpacer(height: 10.h),
                  CustomTextFeild(
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: ColorManager.schedulecolor,
                      ),
                      hintText: StringManager.enteremail,
                      validator: Validator.emailValidator),
                  buildSizedBoxSpacer(height: 10.h),
                  CustomTextFeild(
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorManager.schedulecolor,
                      ),
                      hintText: StringManager.enterpassword,
                      validator: Validator.passValidator),
                  buildSizedBoxSpacer(height: 10.h),
                  CustomTextFeild(
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: ColorManager.schedulecolor,
                      ),
                      hintText: StringManager.enterphnno,
                      validator: Validator.phnNoValidator),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 13.h, left: 20.w, right: 20.w, bottom: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isaMale = true;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8.w),
                                height: 25.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: _isaMale
                                        ? ColorManager.darkyellow
                                        : ColorManager.white,
                                    border: Border.all(
                                        width: 1,
                                        color: ColorManager.bordercolor),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Icon(
                                  Icons.boy_outlined,
                                  color: _isaMale
                                      ? ColorManager.white
                                      : ColorManager.searchiconcolor,
                                ),
                              ),
                              Text(
                                StringManager.male,
                                style: regularTextStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.settingiconcolor,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        buildSizedBoxSpacer(width: 20.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isaMale = false;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8.w),
                                height: 25.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: !(_isaMale)
                                        ? ColorManager.darkyellow
                                        : ColorManager.white,
                                    border: Border.all(
                                        width: 1,
                                        color: !_isSignup
                                            ? ColorManager.darkyellow
                                            : ColorManager.bordercolor),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Icon(
                                  Icons.girl_outlined,
                                  color: !_isaMale
                                      ? ColorManager.white
                                      : ColorManager.searchiconcolor,
                                ),
                              ),
                              Text(
                                StringManager.female,
                                style: regularTextStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.settingiconcolor,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

AnimatedPositioned _bottomContainer(
    bool showShadow, isSignup, context, loginformkey, signupformkey) {
  return AnimatedPositioned(
    duration: const Duration(microseconds: 700),
    curve: Curves.bounceInOut,
    left: 0,
    right: 0,
    top: isSignup ? 510.h : 410.h,
    child: Center(
      child: Container(
        padding: EdgeInsets.all(16.w),
        height: 65.h,
        width: 75.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            if (showShadow)
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1.5,
                  color: Colors.black.withOpacity(.3),
                  offset: const Offset(0, 1)),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            if (!isSignup) {
              if (loginformkey.currentState!.validate()) {
                Navigator.pushNamed(context, DashboardScreen.id);
              }
            }
            if (isSignup) {
              if (signupformkey.currentState!.validate()) {
                Navigator.pushNamed(context, DashboardScreen.id);
              }
            }
          },
          child: !(showShadow)
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange.shade200, Colors.red.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 1)),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: ColorManager.white,
                  ),
                )
              : const Center(),
        ),
      ),
    ),
  );
}

Widget _orSignupWith(isSignup) => Positioned(
      top: 585.h,
      left: 0,
      right: 0,
      child: Column(
        children: [
          isSignup
              ? Text(StringManager.orsignupwith)
              : Text(StringManager.orsignupwith),
          Padding(
            padding: EdgeInsets.only(left: 60.w, top: 20.h, right: 20.w),
            child: Row(
              children: [
                MaterialButton(
                  height: 30.h,
                  minWidth: 70.w,
                  onPressed: () {},
                  color: ColorManager.darkblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsManager.facebookimage,
                        height: 25.h,
                        color: ColorManager.white,
                      ),
                      //buildSizedBoxSpacer(width: 10.w),
                      Text(
                        StringManager.facebook,
                        style: regularTextStyle(
                            color: ColorManager.white, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
                buildSizedBoxSpacer(width: 30.w),
                MaterialButton(
                  height: 30.h,
                  minWidth: 70.w,
                  onPressed: () {},
                  color: ColorManager.darkblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsManager.googleimage,
                        height: 30.h,
                        color: ColorManager.white,
                      ),
                      buildSizedBoxSpacer(width: 5.w),
                      Text(
                        StringManager.google,
                        style: regularTextStyle(
                            color: ColorManager.white, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
