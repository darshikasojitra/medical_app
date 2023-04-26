import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/color_manager.dart';
import 'package:medical_app/ui/screens/home/doctors_details/doctor_search_screen.dart';
import 'package:medical_app/ui/screens/medicinesearch_screen.dart';
import 'package:medical_app/ui/screens/profile_screen.dart';
import '../../../resources/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List smallcontainercolor = [
    ColorManager.lightblue,
    ColorManager.lightyellow,
    ColorManager.lightgreen,
    ColorManager.lightpink,
  ];
  List bigcontainercolor = [
    ColorManager.darkblue,
    ColorManager.darkyellow,
    ColorManager.darkgreen,
    ColorManager.darkpink,
  ];
  List image = [
    Image.asset(AssetsManager.doctorimage),
    Image.asset(AssetsManager.pillicon),
    Image.asset(AssetsManager.medicaltest),
    Image.asset(AssetsManager.coronaimage),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28.w, top: 28.h, right: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '👋 Hello!',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontSize: 16.sp,
                            color: ColorManager.hellotextcolor),
                      ),
                      Text(
                        'Shahin Alam',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 27.sp,
                            color: ColorManager.hellotextcolor),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          },
                          child: Image.asset(AssetsManager.profileimage)),
                      Positioned(
                        left: 25.h,
                        child: Image.asset(AssetsManager.profiledot),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 25.w, right: 25.w, top: 20.h, bottom: 15.h),
              child: searchtextfeild,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Text(
                  'Services',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      color: ColorManager.hellotextcolor),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 15.h, left: 28.w),
              child: Row(
                children: [
                  Container(
                    height: 65.h,
                    width: 330.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 10.w,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorSearchScreen(),
                                    ));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MedicineSearchScreen(),
                                    ));
                              }
                            },
                            child: Container(
                              height: 65.h,
                              width: 65.w,
                              decoration: BoxDecoration(
                                color: smallcontainercolor[index],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: image[index],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
              child: Container(
                height: 140.h,
                width: 400.w,
                decoration: BoxDecoration(
                    color: ColorManager.lightblue,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get the Best',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorManager.darkblack,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Medical Service',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorManager.darkblack,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'NunitoSans',
                                color: Color(0xff4A545E)),
                          ),
                          Text(
                            'ext of the printing',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'NunitoSans',
                                color: Color(0xff4A545E)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 145.h,
                      width: 116.w,
                      decoration: BoxDecoration(
                          // color: Colors.pink,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(28.r))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 0.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            AssetsManager.physicianimage,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w),
                child: Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      color: ColorManager.darkblack),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 28.w),
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 329.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 12.w,
                          ),
                          child: Container(
                              height: 100.h,
                              width: 258.w,
                              decoration: BoxDecoration(
                                color: bigcontainercolor[index],
                                borderRadius: BorderRadius.circular(28.r),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.h, right: 12.w),
                                    child: Container(
                                      height: 70.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: smallcontainercolor[index],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '12',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontFamily: 'NunitoSans',
                                                fontWeight: FontWeight.w800,
                                                color: ColorManager.white),
                                          ),
                                          Text('Tue',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'NunitoSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 140.w,
                                              bottom: 5.h,
                                              top: 10.h,
                                              right: 20.w),
                                          child: Image.asset(
                                              AssetsManager.horozontal3dots),
                                        ),
                                        Text(
                                          '09:30 AM',
                                          style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 12.sp,
                                            fontFamily: 'NunitoSans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'Dr. Mim Akhter',
                                          style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 16.sp,
                                            fontFamily: 'NunitoSans',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Depression',
                                          style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 10.sp,
                                            fontFamily: 'NunitoSans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget searchtextfeild = TextFormField(
  decoration: InputDecoration(
    // contentPadding: EdgeInsets.only(left: 15.w,right: 15.w),
    filled: true,
    fillColor: ColorManager.searchcolor,
    prefixIcon: Padding(
      padding:
          EdgeInsets.only(left: 15.w, right: 10.w, top: 10.h, bottom: 10.h),
      child: Image.asset(AssetsManager.searchimage),
    ),
    suffixIcon: Padding(
      padding: EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h),
      child: Image.asset(AssetsManager.sufiximage),
    ),
    hintText: 'Search medical..',
    hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'NunitoSans',
        color: ColorManager.searchiconcolor),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(color: ColorManager.searchcolor),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorManager.searchcolor)),
  ),
);
