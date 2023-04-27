import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';

class NotoficationScreen extends StatelessWidget {
  static const String id = 'NotoficationScreen';
  const NotoficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List _color = const [
      Color(0xffDCEDF9),
      Color.fromRGBO(241, 230, 234, 0.97),
      Color(0xffFAF0DB),
      Color(0xffD6F6FF),
      Color(0xffF2E3E9),
    ];
    final List _text = [
      '3 Schedules!',
      '14 Messages',
      'Medicine',
      'Vaccine Update',
      'App Update'
    ];
    final List _image = [
      Image.asset(
        AssetsManager.scheduleimage,
        color: Color(0xff1C6BA4),
      ),
      Image.asset(AssetsManager.messageimage),
      Image.asset(AssetsManager.medicineimage),
      Image.asset(AssetsManager.vaccinessimage),
      Image.asset(AssetsManager.clockimage),
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 45.h),
            child: Text(
              'Notifications',
              style: TextStyle(
                  color: Color(0xff0E1012),
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'NunitoSans'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Container(
              width: 320.w,
              height: 520.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _text.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    child: Container(
                      height: 83.h,
                      width: 320.w,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: Color(0xffD7DDEA))),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 16.w),
                            child: Container(
                              height: 47.h,
                              width: 54.w,
                              decoration: BoxDecoration(
                                  color: _color[index],
                                  borderRadius: BorderRadius.circular(18.r)),
                              child: _image[index],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 22.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _text[index],
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'NunitoSans'),
                                ),
                                Text(
                                  'Check your schedule Today',
                                  style: TextStyle(
                                      color: Color(0xff7B8D9E),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'NunitoSans'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
