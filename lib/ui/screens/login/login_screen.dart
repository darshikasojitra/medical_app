import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
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
  final AuthServices _auth = AuthServices();
  final _loginfromKey = GlobalKey<FormState>();
  final _signupfromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phnnoController = TextEditingController();
  bool isprocessing = false;
  bool _isSignup = true;
  bool _isaMale = true;
  bool _passwordVisible = false;
  Future<void> _showpassword() async {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Future<void> _showLogin(value) async {
    setState(() {
      _isSignup = value;
    });
  }

  Future<void> _showmale(value) async {
    setState(() {
      _isaMale = value;
    });
  }

  Future<void> _showDashboardScreen(
      isSignup, loginformkey, signupformkey) async {
    if (!isSignup) {
      if (loginformkey.currentState!.validate()) {
        setState(() {
          isprocessing = true;
        });
        final user = await _auth.signInUsingEmailPassword(
            email: _emailController.text, password: _passwordController.text);
        if (user != null) {
          Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardScreen(),));
          //Navigator.pushNamed(context, DashboardScreen.id);
          setState(() {
            isprocessing = false;
          });
        }
      }
    }
    if (isSignup) {
      setState(() {
        isprocessing = true;
      });
      if (signupformkey.currentState!.validate()) {
        _auth.registerUsingEmailPassword(
          name: _usernameController.text.trim(),
          email: _emailController.text,
          password: _passwordController.text,
        );
        setState(() {
          isprocessing = false;
        });
        Navigator.pushNamed(context, DashboardScreen.id);
      }
    }
  }

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
          _bottomContainer(true, _isSignup, context, _loginfromKey,
              _signupfromKey, _showDashboardScreen),
          AnimatedPositioned(
            duration: const Duration(microseconds: 700),
            curve: Curves.bounceInOut,
            top: 180.h,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 700),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: _isSignup ? 360.h : 250.h,
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
          _bottomContainer(false, _isSignup, context, _loginfromKey,
              _signupfromKey, _showDashboardScreen),
          _orSignupWith(_isSignup, _auth, context),
        ],
      ),
    );
  }

  Widget _loginandsignup() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _showLogin(false),
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
            onTap: () => _showLogin(true),
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
           autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextFeild(
                  obscureText: false,
                  controller: _emailController,
                  hintText: StringManager.enteremail,
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: ColorManager.schedulecolor,
                  ),
                  validator: Validator.emailValidator),
              buildSizedBoxSpacer(height: 14.h),
              CustomTextFeild(
                  obscureText: !_passwordVisible,
                  controller: _passwordController,
                  hintText: StringManager.enterpassword,
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: ColorManager.schedulecolor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorManager.searchiconcolor,
                    ),
                    onPressed: () => _showpassword(),
                  ),
                  validator: Validator.passValidator),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        StringManager.forgotpassword,
                        style: regularTextStyle(
                            color: ColorManager.schedulecolor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      )))
            ],
          ),
        ),
      );
  Widget _signupScreen() => Container(
        margin: EdgeInsets.only(top: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: 400.h,
            child: Form(
              key: _signupfromKey,
               autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  CustomTextFeild(
                      obscureText: false,
                      controller: _usernameController,
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: ColorManager.schedulecolor,
                      ),
                      hintText: StringManager.enterusername,
                      validator: Validator.nameValidator),
                  buildSizedBoxSpacer(height: 10.h),
                  CustomTextFeild(
                      obscureText: false,
                      controller: _emailController,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: ColorManager.schedulecolor,
                      ),
                      hintText: StringManager.enteremail,
                      validator: Validator.emailValidator),
                  buildSizedBoxSpacer(height: 10.h),
                  CustomTextFeild(
                      obscureText: !_passwordVisible,
                      controller: _passwordController,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorManager.schedulecolor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorManager.searchiconcolor,
                        ),
                        onPressed: () => _showpassword(),
                      ),
                      hintText: StringManager.enterpassword,
                      validator: Validator.passValidator),
                  buildSizedBoxSpacer(height: 10.h),
                  IntlPhoneField(
                    flagsButtonPadding: EdgeInsets.only(left: 10.w),
                    dropdownIconPosition: IconPosition.trailing,
                    controller: _phnnoController,
                    decoration: InputDecoration(
                      hintText: StringManager.enterphnno,
                      hintStyle: regularTextStyle(
                        color: ColorManager.settingiconcolor,
                        fontSize: 13.sp,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.bordercolor),
                          borderRadius: BorderRadius.circular(35.r)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.bordercolor),
                          borderRadius: BorderRadius.circular(35.r)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.bordercolor),
                          borderRadius: BorderRadius.circular(35.r)),
                    ),
                    initialCountryCode: 'IN',
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: 13.h, left: 20.w, right: 20.w, bottom: 5.h),
                  //   child: Row(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () => _showmale(true),
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(right: 8.w),
                  //               height: 25.h,
                  //               width: 30.w,
                  //               decoration: BoxDecoration(
                  //                   color: _isaMale
                  //                       ? ColorManager.darkyellow
                  //                       : ColorManager.white,
                  //                   border: Border.all(
                  //                       width: 1,
                  //                       color: ColorManager.bordercolor),
                  //                   borderRadius: BorderRadius.circular(15.r)),
                  //               child: Icon(
                  //                 Icons.boy_outlined,
                  //                 color: _isaMale
                  //                     ? ColorManager.white
                  //                     : ColorManager.searchiconcolor,
                  //               ),
                  //             ),
                  //             Text(
                  //               StringManager.male,
                  //               style: regularTextStyle(
                  //                   fontSize: 12.sp,
                  //                   color: ColorManager.settingiconcolor,
                  //                   fontWeight: FontWeight.w500),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       buildSizedBoxSpacer(width: 20.w),
                  //       GestureDetector(
                  //         onTap: () => _showmale(false),
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(right: 8.w),
                  //               height: 25.h,
                  //               width: 30.w,
                  //               decoration: BoxDecoration(
                  //                   color: !(_isaMale)
                  //                       ? ColorManager.darkyellow
                  //                       : ColorManager.white,
                  //                   border: Border.all(
                  //                       width: 1,
                  //                       color: !_isSignup
                  //                           ? ColorManager.darkyellow
                  //                           : ColorManager.bordercolor),
                  //                   borderRadius: BorderRadius.circular(15.r)),
                  //               child: Icon(
                  //                 Icons.girl_outlined,
                  //                 color: !_isaMale
                  //                     ? ColorManager.white
                  //                     : ColorManager.searchiconcolor,
                  //               ),
                  //             ),
                  //             Text(
                  //               StringManager.female,
                  //               style: regularTextStyle(
                  //                   fontSize: 12.sp,
                  //                   color: ColorManager.settingiconcolor,
                  //                   fontWeight: FontWeight.w500),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );
}

AnimatedPositioned _bottomContainer(bool showShadow, isSignup, context,
    loginformkey, signupformkey, showDashboardScreen) {
  return AnimatedPositioned(
    duration: const Duration(microseconds: 700),
    curve: Curves.bounceInOut,
    left: 0,
    right: 0,
    top: isSignup ? 510.h : 400.h,
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
          onTap: () =>
              showDashboardScreen(isSignup, loginformkey, signupformkey),
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

Widget _orSignupWith(isSignup, auth, context) => Positioned(
      top: 590.h,
      left: 0,
      right: 0,
      child: Column(
        children: [
          isSignup
              ? Text(
                  StringManager.orsignupwith,
                  style: regularTextStyle(
                      fontSize: 14.sp,
                      color: ColorManager.darkblue,
                      fontWeight: FontWeight.w400),
                )
              : Text(
                  StringManager.orsigninwith,
                  style: regularTextStyle(
                      fontSize: 14.sp,
                      color: ColorManager.darkblue,
                      fontWeight: FontWeight.w400),
                ),
          Padding(
            padding: EdgeInsets.only(
                left: 130.w, top: 18.h, right: 100.w, bottom: 10.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Center(
                      child: Icon(
                        Icons.facebook,
                        color: ColorManager.darkblue,
                        size: 30.h,
                      ),
                    ),
                  ),
                ),
                buildSizedBoxSpacer(width: 15.w),
                GestureDetector(
                  onTap: () => auth.signup(context),
                  child: Container(
                    height: 40.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Center(
                      child: Image.asset(
                        AssetsManager.googleimage,
                        height: 22.h,
                        //color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
