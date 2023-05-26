import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/search_doctors/search_doctors_screen.dart';
import 'package:medical_app/ui/screens/home/doctors_details/see_all_doctors.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/home/doctors_details/doctors_details.dart';

class AllDoctorsScreen extends StatefulWidget {
  static const String id = 'AllDoctorsScreen';
  const AllDoctorsScreen({super.key});

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  bool light = true;
  final List _populardoctorimage = [
    Image.asset(AssetsManager.drmim),
    Image.asset(AssetsManager.drjon),
    Image.asset(AssetsManager.drzim),
    Image.asset(AssetsManager.drmim),
    Image.asset(AssetsManager.drjon),
  ];
  final List _livedoctorimage = [
    Image.asset(AssetsManager.firstdoctorimage),
    Image.asset(AssetsManager.seconddoctorimage),
    Image.asset(AssetsManager.thirddoctorimage),
    Image.asset(AssetsManager.firstdoctorimage),
    Image.asset(AssetsManager.seconddoctorimage),
  ];

  final List _doctorname = [
    StringManager.drmim,
    StringManager.drjon,
    StringManager.drzim,
    StringManager.drmim,
    StringManager.drjon,
  ];
  Future<void> _showBottomSheet() async {
    setState(() {
      showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.w),
            topRight: Radius.circular(30.w),
          ),
        ),
        backgroundColor: ColorManager.white,
        builder: (BuildContext context) {
          return const BottomsheetContainer();
        },
      );
    });
  }

  Future<void> _showDoctorScreen(populardoctorimage, doctorname, index) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DoctorDetailScreen(populardoctorimage[index], doctorname[index]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
            child: _appbar(context),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, bottom: 15.h, top: 25.h),
            child: Text(
              StringManager.livedoctors,
              style: regularTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.sp,
                color: ColorManager.darkblack,
              ),
            ),
          ),
          SizedBox(
            height: 75.h,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _livedoctorimage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 25.w, right: 8.w)
                      : EdgeInsets.only(left: 0.w, right: 8.w),
                  child: Stack(
                    children: [
                      Container(
                        child: _livedoctorimage[index],
                      ),
                      Positioned(
                        left: 63.w,
                        child: Image.asset(AssetsManager.livedotimage),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25.w, right: 20.w, top: 25.w),
            child: Row(
              children: [
                Text(
                  StringManager.populardoctors,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17.sp,
                    color: ColorManager.darkblack,
                  ),
                ),
                buildSizedBoxSpacer(
                  width: 125.w,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeeAllDoctorsScreen(),
                        ));
                  },
                  child: Text(
                    StringManager.seeall,
                    style: regularTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorManager.darkblue,
                    ),
                  ),
                )
              ],
            ),
          ),
          _popularDoctorContainer(
              _populardoctorimage, _doctorname, _showDoctorScreen)
        ],
      ),
    ));
  }

  Widget _appbar(BuildContext context) => Row(
        children: [
          Container(
            height: 38.h,
            width: 42.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorManager.bordercolor),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AssetsManager.arrowimage),
            ),
          ),
          buildSizedBoxSpacer(
            width: 77.w,
          ),
          Text(
            StringManager.doctor,
            style: regularTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: ColorManager.darkblack,
            ),
          ),
          buildSizedBoxSpacer(
            width: 85.w,
          ),
          Container(
            height: 38.h,
            width: 42.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: ColorManager.bordercolor),
            ),
            child: GestureDetector(
              onTap: () {
                //_showBottomSheet()
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchDoctorsScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Image.asset(
                  AssetsManager.searchimage,
                  color: ColorManager.darkblue,
                ),
              ),
            ),
          ),
        ],
      );
}

Widget _popularDoctorContainer(
        populardoctorimage, doctorname, showDoctorScreen) =>
    SizedBox(
      height: 416.h,
      width: 370.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 17.h, left: 25.w),
            child: GestureDetector(
              onTap: () =>
                  showDoctorScreen(populardoctorimage, doctorname, index),
              child: Row(
                children: [
                  populardoctorimage[index],
                  buildSizedBoxSpacer(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorname[index],
                        style: regularTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19.sp,
                          color: ColorManager.darkblack,
                        ),
                      ),
                      buildSizedBoxSpacer(height: 3.h),
                      Text(
                        StringManager.cardiologistinapolohospital,
                        style: regularTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: ColorManager.settingiconcolor,
                        ),
                      ),
                      buildSizedBoxSpacer(height: 7.h),
                      starandsearch
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );

Widget starandsearch = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset(AssetsManager.starimage),
    buildSizedBoxSpacer(
      width: 5.w,
    ),
    Text(
      StringManager.text45,
      style: regularTextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 15.sp,
        color: ColorManager.darkblack,
      ),
    ),
    buildSizedBoxSpacer(
      width: 5.w,
    ),
    Text(
      StringManager.review17,
      style: regularTextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13.sp,
        color: ColorManager.settingiconcolor,
      ),
    ),
  ],
);
