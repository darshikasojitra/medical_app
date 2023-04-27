import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/appoinment_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class DoctorDetailScreen extends StatefulWidget {
  static const String id = 'DoctorDetailScreen';
  const DoctorDetailScreen({super.key});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  final List _firsttext = ['Patients', 'Exp.', 'Rating'];
  final List _secondtext = ['100+', '10 yr', '4.67'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            appbarContainer(context),
            Padding(
              padding: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                _threeCard(_firsttext,_secondtext),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 30.h, bottom: 15.h),
                    child: Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color: Color(0xff0E1012),
                          fontFamily: 'NunitoSans'),
                    ),
                  ),
               _aboutText,
                 _availabilitycard,
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppoinmentScreen(),
                            ));
                      },
                      height: 46.h,
                      minWidth: double.infinity,
                      color: Color(0xff1C6BA4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                            color: Color(0xffFFFFFF),
                            fontFamily: 'NunitoSans'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        _doctorIntro,
      ],
    ));
  }
}
Widget appbarContainer(context) => Container(
              height: 210,
              width: double.infinity,
              color: Color(0xff1C6BA4),
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Container(
                        height: 36.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                            color: Color(0xff1C6BA4),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Color(0xffD7DEEA))),
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              AssetsManager.arrowimage,
                              color: Color(0xffFFFFFF),
                            )),
                      ),
                      buildSizedBoxSpacer(
                        width: 90.w,
                      ),
                      Text(
                        'Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: Color(0xffFFFFFF),
                            fontFamily: 'NunitoSans'),
                      ),
                      buildSizedBoxSpacer(
                        width: 90.w,
                      ),
                      Container(
                        height: 36.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                            color: Color(0xff1C6BA4),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Color(0xffD7DEEA))),
                        child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AssetsManager.linkimage,
                              color: Color(0xffFFFFFF),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );

Widget _threeCard(firsttext,secondtext) =>   Row(
                    children: [
                      Container(
                        height: 80.h,
                        width: 305.w,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Container(
                                height: 78.h,
                                width: 95.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffE8EBED),
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        firsttext[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Color(0xff253141),
                                            fontFamily: 'NunitoSans'),
                                      ),
                                      Text(
                                        secondtext[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            color: Color(0xff253141),
                                            fontFamily: 'NunitoSans'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );

Widget _aboutText =    Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 25.w, bottom: 10.h),
                    child: Container(
                      height: 110.h,
                      width: 319.w,
                      child: Column(
                        children: [
                          Text(
                            'MBBS, Ph.D., Fellow, International College of Surgeons. ',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                                color: Color(0xff4A545E),
                                fontFamily: 'NunitoSans'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 60.w, top: 8.h),
                            child: Container(
                              height: 70,
                              width: 319,
                              child: Text(
                                'Ex-Professor & Head of Department Department of Neurosurgery    Dhaka Medical College & Hospital',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    color: Color(0xff4A545E),
                                    fontFamily: 'NunitoSans'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
Widget _availabilitycard =  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, bottom: 35.h, right: 10.w),
                    child: Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        border: Border.all(color: Color(0xffD7DEEA)),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, right: 20.w),
                            child: Container(
                              height: 46.h,
                              width: 52.w,
                              decoration: BoxDecoration(
                                color: Color(0xffDCEDF9),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child:
                                  Image.asset(AssetsManager.detailscreenclock),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Availability',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Color(0xff0E1012),
                                    fontFamily: 'NunitoSans'),
                              ),
                              Text(
                                '6 PM - 9 PM',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    color: Color(0xff0E1012),
                                    fontFamily: 'NunitoSans'),
                              )
                            ],
                          ),
                          buildSizedBoxSpacer(
                            width: 90.w,
                          ),
                          Image.asset(AssetsManager.detailscreenarrow)
                        ],
                      ),
                    ),
                  );

Widget _doctorIntro = Positioned(
  left: 25.w,
  right: 25.w,
  top: 120.h,
  child: Container(
    height: 90.h,
    width: 319.w,
    decoration: BoxDecoration(
      color: Color(0xffFFFFFF),
      borderRadius: BorderRadius.circular(28.r),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.all(14.w),
          child: Image.asset(AssetsManager.detailscreendrimage),
        ),
        Padding(
          padding: EdgeInsets.only(top: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Mim Akhter',
                style: regularTextStyle(
                  color: Color(0xff0E1012),
                  fontSize: 19.sp,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Cardiologist in apolo hospital',
                style: regularTextStyle(
                  color: Color(0xff4A545E),
                  fontSize: 12.sp,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  ),
);
