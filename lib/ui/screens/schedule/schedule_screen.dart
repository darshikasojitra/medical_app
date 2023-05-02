import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/schedule/doctors_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  static const String id = 'ScheduleScreen';
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _dateIndex = 0;
  List<String> date = [
    StringManager.text12,
    StringManager.text13,
    StringManager.text14,
    StringManager.text15,
    StringManager.text16,
    StringManager.text17,
    StringManager.text18,
  ];
  List day = [
    StringManager.tue,
    StringManager.wed,
    StringManager.thu,
    StringManager.fri,
    StringManager.sat,
    StringManager.mon,
    StringManager.tue,
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
                  onTap: () => _selectDate(context),
                  child: Image.asset(AssetsManager.scheduleimage))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: SizedBox(
            height: 65.h,
            width: 350.w,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
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
        ),
        const DoctorsSchedule(),
      ],
    ));
  }
}

_selectDate(BuildContext context) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2010),
    lastDate: DateTime(2025),
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
  );
}
