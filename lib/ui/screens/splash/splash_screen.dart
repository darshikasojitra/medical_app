import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/resources/resources.dart';

import '../dashboard_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event != null) {
          if (mounted) {
            Navigator.pushReplacementNamed(
              context,
              DashboardScreen.id,
            );
          }
        } else {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.id, (route) => false);
          }
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgcolor,
      body: Center(
         child: SizedBox(
          
           height: 210.h,width: 230.w,
          // decoration: BoxDecoration(
          //   color: ColorManager.white,
          //   borderRadius: BorderRadius.circular(110.r),
          //  // border: Border.all(color: ColorManager.bordercolor)
          // ),
      child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_pk5mpw6j.json'),
    )
      ),
    );
  }
}