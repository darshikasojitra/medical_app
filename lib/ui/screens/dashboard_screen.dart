import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'appointments/booking_appointments_screen.dart';
import 'articals/articals_screen.dart';
//import 'appointments/booking_appointments_screen.dart';
import 'home/home_screen.dart';
import 'notifications/notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'DashboardScreen';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _myIndex = 0;
  static List<Widget> widgetList = [
    const HomeScreen(),
    // const ScheduleScreen(),
    const BookingAppointmentsScreen(),
    const ArticalsScreen(),
    // const ReportScreen(),
    const NotoficationScreen(),
  ];
  Future<void> _selectIndex(int index) async {
    setState(() {
      _myIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[_myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _selectIndex(index),
        currentIndex: _myIndex,
        unselectedItemColor: ColorManager.unselectedcolor,
        selectedItemColor: ColorManager.darkblue,
        selectedLabelStyle: regularTextStyle(
          color: ColorManager.darkblue,
          fontSize: 12.sp,
        ),
        unselectedLabelStyle: regularTextStyle(
          color: ColorManager.unselectedcolor,
          fontSize: 12.sp,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_sharp,
              size: 28.sp,
            ),
            label: StringManager.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_sharp,
              size: 28.sp,
            ),
            label: StringManager.appointment,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              size: 28.sp,
            ),
            label: StringManager.article,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 28.sp,
            ),
            label: StringManager.notifications,
          ),
        ],
      ),
    );
  }
}
