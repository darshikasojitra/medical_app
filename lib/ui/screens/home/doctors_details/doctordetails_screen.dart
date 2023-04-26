import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:medical_app/ui/screens/appoinment_screen.dart';
import 'package:medical_app/ui/screens/medicinesearch_screen.dart';

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
            Container(
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
                      SizedBox(
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
                      SizedBox(
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MedicineSearchScreen(),
                                  ));
                            },
                            child: Image.asset(
                              AssetsManager.linkimage,
                              color: Color(0xffFFFFFF),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                        _firsttext[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Color(0xff253141),
                                            fontFamily: 'NunitoSans'),
                                      ),
                                      Text(
                                        _secondtext[index],
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
                    child: Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color: Color(0xff0E1012),
                          fontFamily: 'NunitoSans'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.w, bottom: 20.h),
                    child: Container(
                      height: 100.h,
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
                            padding: EdgeInsets.only(right: 70.w, top: 8.h),
                            child: Container(
                              height: 75,
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
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
                              height: 45.h,
                              width: 45.w,
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
                          SizedBox(
                            width: 100.w,
                          ),
                          Image.asset(AssetsManager.detailscreenarrow)
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
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
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
            left: 28,
            right: 28,
            top: 160,
            child: Container(
              height: 110,
              width: 319,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(AssetsManager.detailscreendrimage),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 31),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Dr. Mim Akhter',
                          style: TextStyle(
                            color: Color(0xff0E1012),
                            fontSize: 19,
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Cardiologist in apolo hospital',
                          style: TextStyle(
                            color: Color(0xff4A545E),
                            fontSize: 12,
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}
