import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:medical_app/ui/screens/home/doctors_details/doctordetails_screen.dart';

class DoctorSearchScreen extends StatefulWidget {
  static const String id = 'DoctorSearchScreen';
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
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
  final List _categorytext = ['Dentist', 'Surgeon', 'Allergist', 'Urologist'];
  final List _doctorname = ['Dr. Mim Akhter', 'Dr. Jon Sina', 'Dr. Zim Khan'];
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
              SizedBox(
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
                                    SizedBox(
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
                                    SizedBox(
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
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 92.h,
                                                    width: 67.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xff1C6BA4))),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 8.h,
                                                                  top: 8.h),
                                                          child: Container(
                                                            height: 54.h,
                                                            width: 54.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.r),
                                                              color: Color(
                                                                  0xff1C6BA4),
                                                            ),
                                                            child:
                                                                _categoryimage[
                                                                    index],
                                                          ),
                                                        ),
                                                        Text(
                                                          _categorytext[index],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'NunitoSans',
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff4A545E)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
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
                                        SizedBox(
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
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffBECADA))),
                                          child: Text(
                                            '0-2 yrs',
                                            style: TextStyle(
                                                fontFamily: 'NunitoSans',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff7B8D9E)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff1C6BA4),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffBECADA))),
                                          child: Text(
                                            '3-5 yrs',
                                            style: TextStyle(
                                                fontFamily: 'NunitoSans',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 25.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffBECADA))),
                                          child: Text(
                                            '10+ yrs',
                                            style: TextStyle(
                                                fontFamily: 'NunitoSans',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff7B8D9E)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
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
                                    // ElevatedButton(
                                    //   child: const Text('Close BottomSheet'),
                                    //   onPressed: () => Navigator.pop(context),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      AssetsManager.bluelinkimage,
                      //color: Color(0xff1C6BA4),
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
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEF6FC),
              prefixIcon: Icon(
                Icons.search,
                size: 28.sp,
                color: Color(0xff8AA0BC),
              ),
              suffixIcon: Image.asset(AssetsManager.sufiximage),
              hintText: 'Search medical..',
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'NunitoSans',
                  color: Color(0xff8AA0BC)),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: Color(0xffEEF6FC)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xffEEF6FC))),
            ),
          ),
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
              SizedBox(
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
    ));
  }
}

Widget _starandsearch = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset(AssetsManager.starimage),
    SizedBox(
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
    SizedBox(
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
