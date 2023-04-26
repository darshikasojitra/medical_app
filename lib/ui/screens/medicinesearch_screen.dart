import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:medical_app/ui/screens/pharmacylocation_screen.dart';

import 'home/doctors_details/doctor_search_screen.dart';

class MedicineSearchScreen extends StatefulWidget {
  static const String id = 'MedicineSearchScreen';
  const MedicineSearchScreen({super.key});

  @override
  State<MedicineSearchScreen> createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  final List _pharmaimage = [
    Image.asset(AssetsManager.firstpharmaimage),
    Image.asset(AssetsManager.secondpharmaimage),
    Image.asset(AssetsManager.firstpharmaimage),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xffD7DEEA))),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(AssetsManager.arrowimage)),
              ),
              SizedBox(
                width: 35.w,
              ),
              Image.asset(AssetsManager.locationimage),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Dhanmondi, Dhaka',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Color(0xff0E1012),
                    fontFamily: 'NunitoSans'),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w, top: 27.h, bottom: 12.h),
          child: Text(
            'Pharmacy Nearby',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.sp,
                color: Color(0xff0E1012),
                fontFamily: 'NunitoSans'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 25.w,
          ),
          child: Container(
            height: 150.h,
            width: 450.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _pharmaimage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Container(
                    height: 150.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      children: [
                        _pharmaimage[index],
                        Padding(
                          padding: EdgeInsets.only(top: 15.h, left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Virgo Pharma',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                    color: Color(0xff0E1012),
                                    fontFamily: 'NunitoSans'),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '2km away',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Color(0xff4A545E),
                                    fontFamily: 'NunitoSans'),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              _starandsearch
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
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            left: 72.w,
          ),
          child: Text(
            'Upload Prescription',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24.sp,
                color: Color(0xff0E1012),
                fontFamily: 'NunitoSans'),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 72.w, right: 62.w, top: 10.h, bottom: 30.h),
          child: Text(
            'We will show the pharmacy that got all the medicine.',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Color(0xff4A545E),
                fontFamily: 'NunitoSans'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 72.w, right: 62.w, bottom: 30.h),
          child: Container(
            height: 130.h,
            width: 250.w,
            decoration: BoxDecoration(
              color: Color(0xffE4E9F1),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 55.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Image.asset(AssetsManager.bluelinkimage,
                            color: Color(0xff1C6BA4)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Share Link',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color(0xff0E1012),
                            fontFamily: 'NunitoSans'),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 55.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Image.asset(AssetsManager.uploadimage),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Upload',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color(0xff0E1012),
                            fontFamily: 'NunitoSans'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 72.w, right: 62.w),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PharmacyLocationScreen(),
                  ));
            },
            height: 46.h,
            minWidth: double.infinity,
            color: Color(0xff1C6BA4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r)),
            child: Text(
              'Continue',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: Color(0xffFFFFFF),
                  fontFamily: 'NunitoSans'),
            ),
          ),
        )
      ],
    ));
  }
}

Widget _starandsearch = Row(
  children: [
    Image.asset(
      AssetsManager.starimage,
      height: 12.h,
      width: 12.w,
    ),
    SizedBox(
      width: 4.w,
    ),
    Text(
      '4.5',
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
          color: Color(0xff0E1012),
          fontFamily: 'NunitoSans'),
    ),
    SizedBox(
      width: 8.w,
    ),
    Text(
      '(17 reviews)',
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Color(0xff4A545E),
          fontFamily: 'NunitoSans'),
    ),
  ],
);
