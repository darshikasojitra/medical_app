import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/ui/screens/schedule/doctors_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  static const String id = 'ScheduleScreen';
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

DateTime? _selectedDate;
String? _selectedDay;

extension DateTimeExtension on DateTime {
  String? weekdayName(int weekday) {
    const Map<int, String> weekdayName = {
      1: "Mon",
      2: "Tue",
      3: "Wed",
      4: "Thu",
      5: "Fri",
      6: "Sat",
      7: "Sun"
    };
    return weekdayName[weekday];
  }
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _dateIndex = 0;
  List<String> date = [
    _selectedDate == null
        ? DateTime.now().day.toString()
        : (_selectedDate!.day).toString(),
    _selectedDate == null
        ? (DateTime.now().day + 1).toString()
        : ((_selectedDate!.day) + 1).toString(),
    _selectedDate == null
        ? (DateTime.now().day + 2).toString()
        : ((_selectedDate!.day) + 2).toString(),
    _selectedDate == null
        ? (DateTime.now().day + 3).toString()
        : ((_selectedDate!.day) + 3).toString(),
    _selectedDate == null
        ? (DateTime.now().day + 4).toString()
        : ((_selectedDate!.day) + 4).toString(),
    _selectedDate == null
        ? (DateTime.now().day + 5).toString()
        : ((_selectedDate!.day) + 5).toString(),
    _selectedDate == null
        ? (DateTime.now().day + 6).toString()
        : ((_selectedDate!.day) + 6).toString(),
  ];
  List day = [
    _selectedDay ?? DateFormat.E().format(DateTime.now()),
    DateTime.now().weekdayName(2),
    DateTime.now().weekdayName(3),
    DateTime.now().weekdayName(4),
    DateTime.now().weekdayName(5),
    DateTime.now().weekdayName(6),
    DateTime.now().weekdayName(7),
  ];
  Future<void> _dateIndexMethod(index) async {
    setState(() {
      _dateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 25.w, right: 25.w, top: 45.h, bottom: 20.h),
          child: Row(
            children: [
              Text(
                StringManager.schedule,
                style: regularTextStyle(
                  color: ColorManager.darkblack,
                  fontWeight: FontWeight.w700,
                  fontSize: 27.sp,
                ),
              ),
              buildSizedBoxSpacer(
                width: 175.w,
              ),
              GestureDetector(
                  onTap: ()  async{
                    await _selectDate(context);
                    setState(() {
                      
                    });
                  },
                  child: Image.asset(AssetsManager.scheduleimage))
            ],
          ),
        ),
        SizedBox(
          height: 65.h,
          width: 350.w,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(left: 25.w, right: 10.w)
                    : EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: () => _dateIndexMethod(index),
                  child: Container(
                    height: 90.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: _dateIndex == index
                          ? ColorManager.darkblue
                          : ColorManager.lightblue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date[index],
                          style: regularTextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w800,
                              color: _dateIndex == index
                                  ? ColorManager.white
                                  : ColorManager.hellotextcolor),
                        ),
                        Text(
                          day[index],
                          style: regularTextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: _dateIndex == index
                                  ? ColorManager.white
                                  : ColorManager.hellotextcolor),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const DoctorsSchedule(),
      ],
    ));
  }

  _selectDate(BuildContext context) async {
     await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2027),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorManager.darkblue,
              onPrimary: ColorManager.white,
              onSurface: ColorManager.darkblack,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorManager.darkblue,
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        _selectedDate = value;
        _selectedDay = DateFormat.E().format(value);
        setState(() {});
      }
    });   
  }
}
