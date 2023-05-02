import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class ReportScreen extends StatelessWidget {
  static const String id = 'ReportScreen';
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List containercolor = [
      ColorManager.lightblue,
      ColorManager.reportcontainercolor,
    ];
    final List reportfile = [
      Image.asset(AssetsManager.bluereportimage),
      Image.asset(AssetsManager.greenreportimage)
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 45.h),
              child: Row(
                children: [
                  Text(
                    StringManager.report,
                    style: regularTextStyle(
                      color: ColorManager.darkblack,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  buildSizedBoxSpacer(
                    width: 200.w,
                  ),
                  Image.asset(
                    AssetsManager.horozontal3dots,
                    color: ColorManager.settingiconcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
              child: Container(
                height: 130.h,
                width: 375.w,
                decoration: BoxDecoration(
                    color: ColorManager.lightblue,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringManager.heartrate,
                            style: regularTextStyle(
                                fontSize: 14.sp,
                                color: ColorManager.darkblack,
                                fontWeight: FontWeight.w400),
                          ),
                          buildSizedBoxSpacer(
                            height: 22.h,
                          ),
                          Image.asset(AssetsManager.bpm),
                        ],
                      ),
                    ),
                    buildSizedBoxSpacer(
                      width: 25.w,
                    ),
                    Image.asset(AssetsManager.graphimage)
                  ],
                ),
              ),
            ),
            _booldGroupContainer,
            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 25.w),
              child: Text(
                StringManager.lattestreport,
                style: regularTextStyle(
                  fontSize: 17.sp,
                  color: ColorManager.darkblack,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            _latestReport(reportfile, containercolor)
          ],
        ),
      ),
    );
  }
}

Widget _booldGroupContainer = Padding(
  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
  child: Row(
    children: [
      Container(
        height: 110.h,
        width: 150.w,
        decoration: BoxDecoration(
            color: ColorManager.bloodcolor,
            borderRadius: BorderRadius.circular(24.r)),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AssetsManager.bloodimage),
                    SizedBox(
                      width: 85.w,
                    ),
                    Image.asset(
                      AssetsManager.horozontal3dots,
                      color: ColorManager.settingiconcolor,
                    ),
                  ],
                ),
              ),
              buildSizedBoxSpacer(
                height: 13.h,
              ),
              Text(
                StringManager.bloodgroup,
                style: regularTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.black),
              ),
              Text(
                StringManager.aplus,
                style: regularTextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.black),
              ),
            ],
          ),
        ),
      ),
      buildSizedBoxSpacer(
        width: 10.w,
      ),
      Container(
        height: 110.h,
        width: 150.w,
        decoration: BoxDecoration(
            color: ColorManager.lightyellow,
            borderRadius: BorderRadius.circular(24.r)),
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, top: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsManager.weightimage),
              SizedBox(
                width: 50.w,
              ),
              Image.asset(
                AssetsManager.horozontal3dots,
                color: ColorManager.settingiconcolor,
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget _latestReport(reportfile, containercolor) => Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: SizedBox(
        width: 350.w,
        height: 200.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: reportfile.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                height: 73.h,
                width: 320.w,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(28.r),
                    border: Border.all(color: ColorManager.reportbordercolor)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 16.h),
                      child: Container(
                        height: 54.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: containercolor[index],
                            borderRadius: BorderRadius.circular(20.r)),
                        child: reportfile[index],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringManager.generalhealth,
                            style: regularTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: ColorManager.darkblack),
                          ),
                          buildSizedBoxSpacer(
                            height: 5.h,
                          ),
                          Text(
                            StringManager.files8,
                            style: regularTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.settingiconcolor),
                          )
                        ],
                      ),
                    ),
                    buildSizedBoxSpacer(
                      width: 95.w,
                    ),
                    Image.asset(AssetsManager.vertical3dotsimage)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
