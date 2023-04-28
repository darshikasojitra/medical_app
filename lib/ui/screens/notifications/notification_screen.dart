import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

class NotoficationScreen extends StatelessWidget {
  static const String id = 'NotoficationScreen';
  const NotoficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
     List color = [
      ColorManager.lightblue,
      ColorManager.rgbpink,
      ColorManager.lightyellow,
      ColorManager.lightgreen,
      ColorManager.lightpink,
    ];
    final List _text = [
      StringManager.schedule3,
      StringManager.messages14,
      StringManager.medicine,
      StringManager.vaccineupdate,
      StringManager.appupdate,
    ];
    final List _image = [
      Image.asset(
        AssetsManager.scheduleimage,
        color: ColorManager.darkblue,
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
              StringManager.notifications,
              style: regularTextStyle(
                color: ColorManager.darkblue,
                fontSize: 27.sp,
                fontWeight: FontWeight.w700,
              ),
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
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: ColorManager.bordercolor)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 16.w),
                            child: Container(
                              height: 47.h,
                              width: 54.w,
                              decoration: BoxDecoration(
                                  color: color[index],
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
                                  style: regularTextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  StringManager.checkyourschedule,
                                  style: regularTextStyle(
                                    color: ColorManager.symptomscolor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
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
