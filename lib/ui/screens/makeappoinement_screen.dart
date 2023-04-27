import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:medical_app/ui/screens/calendar.dart';
import 'package:medical_app/ui/screens/payment_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class MakeAppoinmentScreen extends StatefulWidget {
  static const String id = 'MakeAppoinmentScreen';
  const MakeAppoinmentScreen({super.key});

  @override
  State<MakeAppoinmentScreen> createState() => _MakeAppoinmentScreenState();
}

class _MakeAppoinmentScreenState extends State<MakeAppoinmentScreen> {
  int _myindex = 0;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 28.w, right: 28.w, top: 40.h, bottom: 10.h),
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
                  width: 60.w,
                ),
                Text(
                  'Appointment',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff0E1012)),
                ),
              ],
            ),
          ),
          Container(
              height: 300.h,
              width: 322.w,
              // color: Colors.amber,
              child: NewTableCalender()),
          displaybottomcontainer(context)
        ],
      ),
    );
  }
}

Widget displaybottomcontainer(BuildContext context) => Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff1C6BA4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, top: 40.h, right: 30.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Time',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'NunitoSans',
                    color: Color(0xffFFFFFF)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                height: 100.h,
                width: double.infinity,
                //color: Colors.pink,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 20.h,crossAxisSpacing: 10.w),
                        itemCount: 6,
                    itemBuilder: (context, index) {
                      return   GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                                alignment: Alignment.center,
                                 height: 42.h,
                                // width: 42.w,
                                decoration: BoxDecoration(
                                    color: Color(0xff1C6BA4),
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: const Color(0xffFFFFFF))),
                                child: Text(
                                  '09:30 AM',
                                  style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF)),
                                ),
                              ),
                      );
                    },)
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 6,
                //   itemBuilder: (context, index) {
                // return  Padding(
                //   padding:  EdgeInsets.only(right: 5.w),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Container(
                //               alignment: Alignment.center,
                //               height: 36.h,
                //               width: 90.w,
                //               decoration: BoxDecoration(
                //                   color: Color(0xff1C6BA4),
                //                   borderRadius: BorderRadius.circular(8.r),
                //                   border: Border.all(color: const Color(0xffFFFFFF))),
                //               child: Text(
                //                 '09:30 AM',
                //                 style: TextStyle(
                //                     fontFamily: 'NunitoSans',
                //                     fontSize: 14.sp,
                //                     fontWeight: FontWeight.w700,
                //                     color: Color(0xffFFFFFF)),
                //               ),
                //             ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
                // },
                // ),

                ),
            SizedBox(
              height: 20.h,
            ),
            // Row(
            //   children: [
            //     Container(
            //       alignment: Alignment.center,
            //       height: 36.h,
            //       width: 90.w,
            //       decoration: BoxDecoration(
            //           color: Color(0xff1C6BA4),
            //           borderRadius: BorderRadius.circular(8.r),
            //           border: Border.all(color: const Color(0xffFFFFFF))),
            //       child: Text(
            //         '11:30 AM',
            //         style: TextStyle(
            //             fontFamily: 'NunitoSans',
            //             fontSize: 14.sp,
            //             fontWeight: FontWeight.w700,
            //             color: Color(0xffFFFFFF)),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       height: 36.h,
            //       width: 90.w,
            //       decoration: BoxDecoration(
            //           color: Color(0xff1C6BA4),
            //           borderRadius: BorderRadius.circular(8.r),
            //           border: Border.all(color: const Color(0xffFFFFFF))),
            //       child: Text(
            //         '12:00 AM',
            //         style: TextStyle(
            //             fontFamily: 'NunitoSans',
            //             fontSize: 14.sp,
            //             fontWeight: FontWeight.w700,
            //             color: Color(0xffFFFFFF)),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       height: 36.h,
            //       width: 90.w,
            //       decoration: BoxDecoration(
            //           color: Color(0xff1C6BA4),
            //           borderRadius: BorderRadius.circular(8.r),
            //           border: Border.all(color: const Color(0xffFFFFFF))),
            //       child: Text(
            //         '12:30 AM',
            //         style: TextStyle(
            //             fontFamily: 'NunitoSans',
            //             fontSize: 14.sp,
            //             fontWeight: FontWeight.w700,
            //             color: Color(0xffFFFFFF)),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 45.h,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ));
              },
              height: 46.h,
              minWidth: double.infinity,
              color: Color(0xffFFFFFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r)),
              child: Text(
                'Make Appointment',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: Color(0xff1C6BA4),
                    fontFamily: 'NunitoSans'),
              ),
            )
          ],
        ),
      ),
    );
