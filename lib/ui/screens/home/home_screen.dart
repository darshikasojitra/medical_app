import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/doctor_search_screen.dart';
import 'package:medical_app/ui/screens/home/medicines_details/medicinesearch_screen.dart';
import 'package:medical_app/ui/screens/home/user_profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _smallcontainercolor = [
    ColorManager.lightblue,
    ColorManager.lightyellow,
    ColorManager.lightgreen,
    ColorManager.lightpink,
  ];
  final List _bigcontainercolor = [
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
              child: _userintro(context),
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
                  StringManager.services,
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.hellotextcolor),
                ),
              ),
            ),
            _serviceCard(image, _smallcontainercolor),
            _medicalServicecard,
            buildSizedBoxSpacer(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w),
                child: Text(
                  StringManager.upcomingappointments,
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.darkblack),
                ),
              ),
            ),
            _upoinmentcard(_bigcontainercolor, _smallcontainercolor)
          ],
        ),
      )),
    );
  }
}

SizedBox buildSizedBoxSpacer({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget _userintro(context) => Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.hello,
              style: regularTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.hellotextcolor),
            ),
            Text(
              StringManager.sahinalam,
              style: regularTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 27.sp,
                  color: ColorManager.hellotextcolor),
            )
          ],
        ),
        buildSizedBoxSpacer(
          width: 100.w,
        ),
        Stack(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen.id);
                },
                child: Image.asset(AssetsManager.profileimage)),
            Positioned(
              left: 25.h,
              child: Image.asset(AssetsManager.profiledot),
            )
          ],
        ),
      ],
    );

Widget searchtextfeild = TextFormField(
  decoration: InputDecoration(
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
    hintText: StringManager.searchmedical,
    hintStyle:
        regularTextStyle(fontSize: 12.sp, color: ColorManager.searchiconcolor),
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(color: ColorManager.searchcolor),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorManager.searchcolor)),
  ),
);
Widget _serviceCard(image, smallcontainercolor) => Padding(
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
                        Navigator.pushNamed(context, DoctorSearchScreen.id);
                      } else if (index == 1) {
                        Navigator.pushNamed(context, MedicineSearchScreen.id);
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
    );

Widget _medicalServicecard = Padding(
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
          child: Container(
            width: 154.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.bestmedicalservice,
                  style: regularTextStyle(
                      fontSize: 20.sp,
                      color: ColorManager.darkblack,
                      fontWeight: FontWeight.w700),
                ),
                buildSizedBoxSpacer(
                  height: 5.h,
                ),
                Text(
                  StringManager.loremipsum,
                  style: regularTextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.settingiconcolor),
                ),
              ],
            ),
          ),
        ),
        buildSizedBoxSpacer(
          width: 20.w,
        ),
        Container(
          height: 145.h,
          width: 116.w,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(28.r))),
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
);

Widget _upoinmentcard(bigcontainercolor, smallcontainercolor) => Padding(
      padding: EdgeInsets.only(top: 15.h, left: 28.w),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 329.w,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
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
                            padding: EdgeInsets.only(left: 8.h, right: 12.w),
                            child: Container(
                              height: 70.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: smallcontainercolor[index],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    StringManager.text12,
                                    style: regularTextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        color: ColorManager.white),
                                  ),
                                  Text(StringManager.tue,
                                      style: regularTextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.white)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  StringManager.time9_30,
                                  style: regularTextStyle(
                                    color: ColorManager.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  StringManager.drmim,
                                  style: regularTextStyle(
                                    color: ColorManager.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  StringManager.depression,
                                  style: regularTextStyle(
                                    color: ColorManager.white,
                                    fontSize: 10.sp,
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
    );
