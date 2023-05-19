import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/route_manager.dart';
import 'package:medical_app/ui/screens/splash/splash_screen.dart';

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

    return ScreenUtilInit(
       
      minTextAdapt: false,
      builder: (context, child) {
        return  MaterialApp(
        title: 'Medical App',
         initialRoute: SplashScreen.id,
         routes: routes,
      );
      },
    );
  }
}

