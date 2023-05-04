import 'package:flutter/material.dart';
import 'package:medical_app/ui/screens/login/login_screen.dart';
import '../ui/screens/reports/report_screen.dart';
import '../ui/screens/dashboard_screen.dart';
import '../ui/screens/home/doctors_details/doctor_search_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/home/medicines_details/medicinesearch_screen.dart';
import '../ui/screens/notifications/notification_screen.dart';
import '../ui/screens/home/user_profile/profile_screen.dart';
import '../ui/screens/schedule/schedule_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.id: (context) => const LoginScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  DashboardScreen.id: (context) => const DashboardScreen(),
  DoctorSearchScreen.id: (context) => const DoctorSearchScreen(),
  MedicineSearchScreen.id: (context) => const MedicineSearchScreen(),
  NotoficationScreen.id: (context) => const NotoficationScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
  ScheduleScreen.id: (context) => const ScheduleScreen(),
  ReportScreen.id: (context) => const ReportScreen(),
};
