import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/doctors_details.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class DoctorsSchedule extends StatefulWidget {
  const DoctorsSchedule({super.key});

  @override
  State<DoctorsSchedule> createState() => _DoctorsScheduleState();
}

class _DoctorsScheduleState extends State<DoctorsSchedule> {
  int _cardIndex = 0;
  void _selectIndex(index) {
    setState(() {
      _cardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List doctorsimages = [
      Image.asset(AssetsManager.zimimage),
      Image.asset(AssetsManager.shahinimage),
      Image.asset(AssetsManager.mimimage)
    ];
    final List colors = [
      ColorManager.darkblue,
      ColorManager.rgbpink,
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
Future<void> _showDoctorScreen(populardoctorimage, doctorname, index) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DoctorDetailScreen(populardoctorimage[index], doctorname[index]),
        ));
  }
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: SizedBox(
        height: 450.h,
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
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
                        StringManager.dash,
                        style: regularTextStyle(
                          color: ColorManager.schedulecolor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      _showDoctorScreen(doctorsimages,drname,index);
                    },
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
                            child: Container(
                              width: 150.w,
                              //color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    calendertime[index],
                                    style: regularTextStyle(
                                      color: index == 0
                                          ? ColorManager.white
                                          : ColorManager.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    drname[index],
                                    style: regularTextStyle(
                                      color: _cardIndex == index
                                          ? ColorManager.white
                                          : ColorManager.darkblack,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    StringManager.cardiologist,
                                    style: regularTextStyle(
                                      color: _cardIndex == index
                                          ? ColorManager.white
                                          : ColorManager.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(alignment: Alignment.topRight,
                            child: Padding(
                              padding:  EdgeInsets.only(top: 15.h,left: 55.w),
                              child: Image.asset(
                                        AssetsManager.vertical3dotsimage,
                                        color: index == 0
                                            ? ColorManager.white
                                            : ColorManager.black,
                                      ),
                            ),
                          ),
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
