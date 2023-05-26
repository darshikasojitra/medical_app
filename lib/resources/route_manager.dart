import 'package:flutter/material.dart';
import 'package:medical_app/ui/screens/login/login_screen.dart';
import 'package:medical_app/ui/screens/splash/splash_screen.dart';
import '../ui/screens/reports/report_screen.dart';
import '../ui/screens/dashboard_screen.dart';
import '../ui/screens/home/doctors_details/all_doctors_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/home/medicines_details/medicinesearch_screen.dart';
import '../ui/screens/notifications/notification_screen.dart';
import '../ui/screens/home/user_profile/profile_screen.dart';
import '../ui/screens/schedule/schedule_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.id: (context) => const LoginScreen(),
  SplashScreen.id: (context) => const SplashScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  DashboardScreen.id: (context) => const DashboardScreen(),
  AllDoctorsScreen.id: (context) => const AllDoctorsScreen(),
  MedicineSearchScreen.id: (context) => const MedicineSearchScreen(),
  NotoficationScreen.id: (context) => const NotoficationScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
  ScheduleScreen.id: (context) => const ScheduleScreen(),
  ReportScreen.id: (context) => const ReportScreen(),
  
};
