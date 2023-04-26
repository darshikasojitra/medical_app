import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/ui/screens/profile_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class NewTableCalender extends StatefulWidget {
  const NewTableCalender({super.key});

  @override
  State<NewTableCalender> createState() => _NewTableCalenderState();
}

class _NewTableCalenderState extends State<NewTableCalender> {
  daypredicate() {}
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
  
        daysOfWeekVisible: false,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: Color(0xff0E1012),
            fontSize: 34.sp,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Color(0xff4A545E),
            size: 30.sp,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Color(0xff4A545E),
            size: 30.sp,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayTextStyle: TextStyle(
              color: Color(0xffFFFFFF),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15.sp),
          // selectedDecoration: BoxDecoration(
          //   color: Color(0xff1C6BA4),
          //   shape: BoxShape.rectangle,
          //   borderRadius: BorderRadius.circular(10.r),
          // ),
          
        ),
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2020, 10, 20),
        lastDay: DateTime.utc(2040, 10, 20),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          Container(height: 100,width: 100,color: Colors.blue,);
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
           
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
       
      ),
    );
  }
}
