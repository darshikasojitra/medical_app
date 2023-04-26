import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:medical_app/resources/color_manager.dart';

class ScheduleScreen extends StatefulWidget {
  static const String id = 'ScheduleScreen';
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<String> date = ['12', '13', '14', '15', '16', '17', '18'];
  List day = ['Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon'];
  final List _doctorsimages = [
    Image.asset(AssetsManager.zimimage),
    Image.asset(AssetsManager.shahinimage),
    Image.asset(AssetsManager.mimimage)
  ];
  final List _colors = [
    ColorManager.darkblue,
    Color.fromRGBO(241, 230, 234, 0.97),
    ColorManager.lightyellow
  ];
  final List _time = ['12:30 PM', '11:30 AM', '10:30 PM'];
  final List _drname = ['Dr. Zim Akhter', 'Dr. Shahin Alam', 'Dr. Mim Akhter'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 45.h, bottom: 20.h),
            child: Row(
              children: [
                Text(
                  'Schedule',
                  style: TextStyle(
                      color: Color(0xff0E1012),
                      fontWeight: FontWeight.w700,
                      fontSize: 27.sp,
                      fontFamily: 'NunitoSans'),
                ),
                SizedBox(
                  width: 170.w,
                ),
                Image.asset(AssetsManager.scheduleimage)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Container(
              height: 60.h,
              width: 350.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Container(
                      height: 84.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Color(0xff1C6BA4),
                        //Color(0xffDCEDF9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date[index],
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w800,
                                color: Color(0xffFFFFFF)),
                          ),
                          Text(day[index],
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Container(
              ///color: Colors.blue,
              height: 600.h,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        child: Row(
                          children: [
                            Text(
                              '12:00 PM',
                              style: TextStyle(
                                  color: Color(0xff7D96B5),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'NunitoSans'),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '- - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                              style: TextStyle(
                                  color: Color(0xff7D96B5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'NunitoSans'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100.h,
                        width: 360.w,
                        decoration: BoxDecoration(
                          color: _colors[index],
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 15.w),
                              child: Container(
                                child: _doctorsimages[index],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 200.w, bottom: 5.w),
                                    child: Image.asset(
                                      AssetsManager.horozontal3dots,
                                      color: Color(0xff0C1115),
                                    ),
                                  ),
                                  Text(
                                    _time[index],
                                    style: TextStyle(
                                      color: Color(0xff0C1115),
                                      fontSize: 14.sp,
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    _drname[index],
                                    style: TextStyle(
                                      color: Color(0xff0E1012),
                                      fontSize: 17.sp,
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Cardiologist',
                                    style: TextStyle(
                                      color: Color(0xff0C1115),
                                      fontSize: 12.sp,
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
