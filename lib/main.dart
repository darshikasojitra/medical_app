import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/route_manager.dart';
import 'package:medical_app/ui/screens/login/login_screen.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
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

