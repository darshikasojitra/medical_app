import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';

class ReportScreen extends StatefulWidget {
  static const String id = 'ReportScreen';
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List _containercolor = [
    Color(0xffDCEDF9),
    Color(0xffD6FFF3),
  ];
  final List _reportfile = [
    Image.asset(AssetsManager.bluereportimage),
    Image.asset(AssetsManager.greenreportimage)
  ];
  @override
  Widget build(BuildContext context) {
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
                    'Report',
                    style: TextStyle(
                        color: Color(0xff0E1012),
                        fontSize: 27.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NunitoSans'),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  Image.asset(
                    AssetsManager.horozontal3dots,
                    color: Color(0xff4A545E),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
              child: Container(
                height: 130.h,
                width: 375.w,
                decoration: BoxDecoration(
                    color: const Color(0xffDCEDF9),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Heart Rate',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff0E1012),
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Image.asset(AssetsManager.bpm),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Image.asset(AssetsManager.graphimage)
                  ],
                ),
              ),
            ),
          
            Padding(
              padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 20.h),
              child: Row(
                children: [
                  Container(
                    height: 110.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5E1E9),
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 20.h,),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Image.asset(AssetsManager.bloodimage),
                                 SizedBox(width: 85.w,),
                                Image.asset(
                                  AssetsManager.horozontal3dots,
                                  color: const Color(0xff4A545E),
                                ),
                               
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Text(
                            'Blood Group',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'NunitoSans'),
                          ),
                          Text(
                            'A+',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'NunitoSans'),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height: 110.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffFAF0DB),
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 18.w,top: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AssetsManager.weightimage),
                          SizedBox(width: 50.w,),
                          Image.asset(
                            AssetsManager.horozontal3dots,
                            color: const Color(0xff4A545E),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
            Padding(
              padding:  EdgeInsets.only(left: 25.w,top: 25.w),
              child: Text(
                'Lattest Report',
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Color(0xff0E1012),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NunitoSans'),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 25.w,right: 25.w),
              child: Container(
                width: 350.w,
                height: 200.h,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _reportfile.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 20.h),
                      child: Container(
                        height: 73.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(28.r),
                          border: Border.all(color: Color(0xffD7DDEA))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 10.w, right: 16.h),
                              child: Container(
                                height: 54.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    color: _containercolor[index],
                                    borderRadius:
                                        BorderRadius.circular(20.r)),
                                child: _reportfile[index],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'General Health',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'NunitoSans'),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Text(
                                    '8 files',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'NunitoSans'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
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
            )
          ],
        ),
      ),
    );
  }
}
