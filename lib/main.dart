import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/route_manager.dart';
import 'package:medical_app/ui/screens/dashboard_screen.dart';
import 'package:medical_app/ui/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MedicalApp());
}

class MedicalApp extends StatefulWidget {
  const MedicalApp({super.key});

  @override
  State<MedicalApp> createState() => _MedicalAppState();
}

class _MedicalAppState extends State<MedicalApp> {
  @override
  Widget build(BuildContext context) {
     @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
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

    return ScreenUtilInit(
       
      minTextAdapt: false,
      builder: (context, child) {
        return  MaterialApp(
        title: 'Medical App',
        //home: const LoginScreen(),
         initialRoute: LoginScreen.id,
        // //DashboardScreen.id,
         routes: routes,
      );
      },
    );
  }
}

