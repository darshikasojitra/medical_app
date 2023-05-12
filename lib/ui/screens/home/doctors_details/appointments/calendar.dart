import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class NewTableCalender extends StatefulWidget {
  const NewTableCalender({super.key});

  @override
  State<NewTableCalender> createState() => _NewTableCalenderState();
}

class _NewTableCalenderState extends State<NewTableCalender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Future<void> _showSelectedDay(selectedDay, focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  Future<void> _showCalenderFormat(format) async {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  Future<void> _showFocusDay(focusedDay) async {
    _focusedDay = focusedDay;
  }
@override
  void initState() {
   print("selected days -- ${_selectedDay?.day}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        rowHeight: 35.h,
        daysOfWeekVisible: false,
        headerStyle: HeaderStyle(
          titleTextFormatter: (date, locale) =>
              DateFormat.MMMM(locale).format(_focusedDay).toString(),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: regularTextStyle(
            color: ColorManager.darkblack,
            fontSize: 34.sp,
            fontWeight: FontWeight.w800,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: ColorManager.settingiconcolor,
            size: 30.sp,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: ColorManager.settingiconcolor,
            size: 30.sp,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.darkblue,
          ),
          todayTextStyle: regularTextStyle(
              color: ColorManager.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15.sp),
          selectedDecoration: BoxDecoration(
            color: ColorManager.darkblue,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: regularTextStyle(
              color: ColorManager.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15.sp),
        ),
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2020, 10, 20),
        lastDay: DateTime.utc(2040, 10, 20),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
        },
        onFormatChanged: (format) => {
          if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      }),
    }
        },
        onPageChanged: (focusedDay) =>  _focusedDay = focusedDay,
      ),
    );
  }
}
