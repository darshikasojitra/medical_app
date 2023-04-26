import 'package:flutter/material.dart';
import 'package:medical_app/ui/screens/reports/report_screen.dart';
import 'package:medical_app/ui/screens/schedule/schedule_screen.dart';

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
     const ScheduleScreen(),
     const ReportScreen(),
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
          //backgroundColor: Colors.white,
          onTap: (index) => _selectIndex(index),
          currentIndex: _myIndex,
          unselectedItemColor: Color(0xff7B8D9E),
          selectedItemColor: Color(0xff1C6BA4),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                size: 28,
              ),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_services_rounded,
                size: 28,
              ),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 28,
              ),
              label: 'Notification',
            ),
          ]),
    );
  }
}
