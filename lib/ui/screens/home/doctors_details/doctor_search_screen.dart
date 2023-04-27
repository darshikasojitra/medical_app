import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:medical_app/ui/screens/home/doctors_details/doctordetails_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class DoctorSearchScreen extends StatefulWidget {
  static const String id = 'DoctorSearchScreen';
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  int _myindex = 0;
  int _yerindex = 0;
  bool light = true;
  final List _populardoctorimage = [
    Image.asset(AssetsManager.drmim),
    Image.asset(AssetsManager.drjon),
    Image.asset(AssetsManager.drzim)
  ];
  final List _livedoctorimage = [
    Image.asset(AssetsManager.firstdoctorimage),
    Image.asset(AssetsManager.seconddoctorimage),
    Image.asset(AssetsManager.thirddoctorimage),
    Image.asset(AssetsManager.firstdoctorimage),
    Image.asset(AssetsManager.seconddoctorimage),
    Image.asset(AssetsManager.thirddoctorimage),
    Image.asset(AssetsManager.fourthdoctorimage),
  ];
  final List _categoryimage = [
    Image.asset(AssetsManager.dentistimage),
    Image.asset(AssetsManager.surgeonimage),
    Image.asset(AssetsManager.allergistimage),
    Image.asset(AssetsManager.urologistimage),
  ];
  final List _yeartext = ['0-2 yrs', '3-5 yrs', '10+ yrs'];
  final List _categorytext = ['Dentist', 'Surgeon', 'Allergist', 'Urologist'];
  final List _doctorname = ['Dr. Mim Akhter', 'Dr. Jon Sina', 'Dr. Zim Khan'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                buildSizedBoxSpacer(
                  width: 85.w,
                ),
                Text(
                  'Doctors',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: Color(0xff0E1012),
                      fontFamily: 'NunitoSans'),
                ),
                buildSizedBoxSpacer(
                  width: 80.w,
                ),
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Color(0xffD7DEEA))),
                  child: GestureDetector(
                      onTap: () {
                    setState(() {
                          showModalBottomSheet<void>(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.w),
                              topRight: Radius.circular(30.w),
                            ),
                          ),
                          backgroundColor: Color(0xffFFFFFF),
                          builder: (BuildContext context) {
                            return Container(
                              height: 500.h,
                              child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Container(
                                          height: 5.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff1C6BA4),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      buildSizedBoxSpacer(
                                        height: 15.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Categories',
                                          style: TextStyle(
                                              fontFamily: 'NunitoSans',
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff0E1012)),
                                        ),
                                      ),
                                      buildSizedBoxSpacer(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 92.h,
                                            width: 310.w,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 4,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 8.w),
                                                  child: Container(
                                                    height: 92.h,
                                                    width: 67.w,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffFFFFFF),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.r),
                                                        border: Border.all(
                                                            color: _myindex ==
                                                                    index
                                                                ? const Color(
                                                                    0xff1C6BA4)
                                                                : const Color(
                                                                    0xffD7DEEA))),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 8.h,
                                                                  top: 8.h),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                _myindex = index;
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 54.h,
                                                              width: 54.w,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(16
                                                                              .r),
                                                                  border: Border.all(
                                                                      color: _myindex ==
                                                                              index
                                                                          ? const Color(
                                                                              0xff1C6BA4)
                                                                          : const Color(
                                                                              0xffD7DEEA)),
                                                                  color: _myindex ==
                                                                          index
                                                                      ? const Color(
                                                                          0xff1C6BA4)
                                                                      : const Color(
                                                                          0xffFFFFFF)),
                                                              child:
                                                                  _categoryimage[
                                                                      index],
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          _categorytext[index],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'NunitoSans',
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color: Color(
                                                                  0xff4A545E)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      buildSizedBoxSpacer(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nearby Doctors',
                                              style: TextStyle(
                                                  fontFamily: 'NunitoSans',
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff7B8D9E)),
                                            ),
                                          ),
                                          buildSizedBoxSpacer(
                                            width: 25.w,
                                          ),
                                          Image.asset(AssetsManager.switchimage),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30..h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Experience',
                                          style: TextStyle(
                                              fontFamily: 'NunitoSans',
                                              fontSize: 22.sp,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff253141)),
                                        ),
                                      ),
                                      buildSizedBoxSpacer(
                                        height: 20.h,
                                      ),
                                      Container(
                                        height: 25.h,
                                        width: 300.w,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _yeartext.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _yerindex = index;
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25.h,
                                                  width: 90.w,
                                                  decoration: BoxDecoration(
                                                      color: _yerindex == index
                                                          ? Color(0xff1C6BA4)
                                                          : Color(0xffFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffBECADA))),
                                                  child: Text(
                                                    _yeartext[index],
                                                    style: TextStyle(
                                                        fontFamily: 'NunitoSans',
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: _yerindex == index
                                                            ? Color(0xffFFFFFF)
                                                            : Color(0xff7B8D9E)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      buildSizedBoxSpacer(
                                        height: 20.h,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineSearchScreen(),));
                                        },
                                        height: 46.h,
                                        minWidth: double.infinity,
                                        color: Color(0xff1C6BA4),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14.r)),
                                        child: Text(
                                          'Apply',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp,
                                              color: Color(0xffFFFFFF),
                                              fontFamily: 'NunitoSans'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                    });
                      },
                      child: Image.asset(
                        AssetsManager.linkimage,
                        color: Color(0xff0E1012),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              top: 20.h,
              bottom: 18.h,
            ),
            child: searchtextfeild,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              'Live Doctors',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp,
                  color: Color(0xff0E1012),
                  fontFamily: 'NunitoSans'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 25.w, bottom: 30.h),
            child: Container(
              height: 75.h,
              width: 350.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _livedoctorimage.length,
                itemBuilder: (context, index) {
                  return _livedoctorimage[index];
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Row(
              children: [
                Text(
                  'Popular Doctors',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17.sp,
                      color: Color(0xff0E1012),
                      fontFamily: 'NunitoSans'),
                ),
                buildSizedBoxSpacer(
                  width: 145.w,
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xff1C6BA4),
                      fontFamily: 'NunitoSans'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.w,
            ),
            child: Container(
              height: 340.h,
              width: 350.w,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _populardoctorimage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 17.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailScreen(),
                            ));
                      },
                      child: Row(
                        children: [
                          _populardoctorimage[index],
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _doctorname[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp,
                                    color: Color(0xff0E1012),
                                    fontFamily: 'NunitoSans'),
                              ),
                              Text(
                                'Cardiologist in apolo hospital',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Color(0xff4A545E),
                                    fontFamily: 'NunitoSans'),
                              ),
                              _starandsearch
                            ],
                          )
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
        ));
  }
}

Widget _starandsearch = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset(AssetsManager.starimage),
    buildSizedBoxSpacer(
      width: 5.w,
    ),
    Text(
      '4.5',
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15.sp,
          color: Color(0xff0E1012),
          fontFamily: 'NunitoSans'),
    ),
    buildSizedBoxSpacer(
      width: 5.w,
    ),
    Text(
      '(17 reviews)',
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: Color(0xff4A545E),
          fontFamily: 'NunitoSans'),
    ),
  ],
);
