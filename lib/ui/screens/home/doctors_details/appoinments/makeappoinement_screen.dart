import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appoinments/calendar.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appoinments/payment_screen.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';

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
                  height: 38.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ColorManager.bordercolor)),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(AssetsManager.arrowimage)),
                ),
                SizedBox(
                  width: 60.w,
                ),
                Text(
                  StringManager.appointment,
                  style: regularTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.darkblack),
                ),
              ],
            ),
          ),
          Container(
              height: 300.h,
              width: 322.w,
             
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
          color: ColorManager.darkblue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, top: 40.h, right: 30.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringManager.time,
                style: regularTextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorManager.white),
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
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 10.w),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 42.h,
                        // width: 42.w,
                        decoration: BoxDecoration(
                            color: ColorManager.darkblue,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: ColorManager.white)),
                        child: Text(
                          StringManager.time9_30,
                          style: regularTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.white),
                        ),
                      ),
                    );
                  },
                )
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
            CustomButtons(
              onPressed: (() {
                Navigator.pushNamed(context, PaymentScreen.id);
              }),
              height: 46.h,
              minWidth: double.infinity,
              color: ColorManager.white,
              child: Text(
                StringManager.makeappointment,
                style: regularTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: ColorManager.darkblue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
