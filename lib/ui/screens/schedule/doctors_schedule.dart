import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class DoctorsSchedule extends StatefulWidget {
  const DoctorsSchedule({super.key});

  @override
  State<DoctorsSchedule> createState() => _DoctorsScheduleState();
}

class _DoctorsScheduleState extends State<DoctorsSchedule> {
  @override
  Widget build(BuildContext context) {
    int cardIndex = 0;
    final List doctorsimages = [
      Image.asset(AssetsManager.zimimage),
      Image.asset(AssetsManager.shahinimage),
      Image.asset(AssetsManager.mimimage)
    ];
    final List colors = [
      ColorManager.darkblue,
      ColorManager.doctorcontainercolor,
      ColorManager.lightyellow
    ];
    final List calendertime = [
      StringManager.time12_30,
      StringManager.time11_30,
      StringManager.time10_30
    ];
    final List scheduletime = [
      StringManager.time12_00,
      StringManager.time11_00,
      StringManager.time10_00
    ];
    final List drname = [
      StringManager.drzim,
      StringManager.drshahin,
      StringManager.drmim,
    ];
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Container(
        height: 450.h,
        width: double.infinity,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      Text(
                        scheduletime[index],
                        style: regularTextStyle(
                          color: ColorManager.schedulecolor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      buildSizedBoxSpacer(
                        width: 10.w,
                      ),
                      Text(
                        '- - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        style: regularTextStyle(
                          color: ColorManager.schedulecolor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cardIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Container(
                      height: 100.h,
                      width: 360.w,
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 15.w),
                            child: Container(
                              child: doctorsimages[index],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 22.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 200.w, bottom: 5.w),
                                  child: Image.asset(
                                    AssetsManager.horozontal3dots,
                                    color: cardIndex == index
                                        ? ColorManager.white
                                        : ColorManager.black,
                                  ),
                                ),
                                Text(
                                  calendertime[index],
                                  style: regularTextStyle(
                                    color: cardIndex == index
                                        ? ColorManager.white
                                        : ColorManager.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  drname[index],
                                  style: regularTextStyle(
                                    color: cardIndex == index
                                        ? ColorManager.white
                                        : ColorManager.darkblack,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  StringManager.cardiologist,
                                  style: regularTextStyle(
                                    color: cardIndex == index
                                        ? ColorManager.white
                                        : ColorManager.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
