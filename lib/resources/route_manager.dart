import 'package:flutter/material.dart';

import '../ui/screens/reports/report_screen.dart';
import '../ui/screens/home/doctors_details/appoinments/appoinment_screen.dart';
import '../ui/screens/dashboard_screen.dart';
import '../ui/screens/home/doctors_details/doctor_search_screen.dart';
import '../ui/screens/home/doctors_details/doctordetails_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/home/doctors_details/appoinments/makeappoinement_screen.dart';
import '../ui/screens/home/medicines_details/medicinesearch_screen.dart';
import '../ui/screens/home/doctors_details/appoinments/message_screen.dart';
import '../ui/screens/notifications/notification_screen.dart';
import '../ui/screens/home/doctors_details/appoinments/payment_screen.dart';
import '../ui/screens/home/medicines_details/pharmacylocation_screen.dart';
import '../ui/screens/home/user_profile/profile_screen.dart';
import '../ui/screens/schedule/schedule_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.id: (context) => const HomeScreen(),
  AppoinmentScreen.id: (context) => const AppoinmentScreen(),
  DashboardScreen.id: (context) => const DashboardScreen(),
  DoctorSearchScreen.id: (context) => const DoctorSearchScreen(),
  DoctorDetailScreen.id: (context) => const DoctorDetailScreen(),
  MakeAppoinmentScreen.id: (context) => const MakeAppoinmentScreen(),
  MedicineSearchScreen.id: (context) => const MedicineSearchScreen(),
  MessageScreen.id: (context) => const MessageScreen(),
  NotoficationScreen.id: (context) => const NotoficationScreen(),
  PaymentScreen.id: (context) => PaymentScreen(),
  PharmacyLocationScreen.id: (context) => const PharmacyLocationScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
  ScheduleScreen.id: (context) => const ScheduleScreen(),
  ReportScreen.id: (context) => const ReportScreen(),
};
