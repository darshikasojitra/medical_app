import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/route_manager.dart';
import 'ui/screens/dashboard_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MedicalApp()));
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
        //home: const DashboardScreen(),
        initialRoute: DashboardScreen.id,
        routes: routes,
      );
      },
    );
  }
}

