import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/ui/screens/message_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../resources/assets_manager.dart';

  

 class PaymentScreen extends StatefulWidget {
static const String id = 'PaymentScreen';
   PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
final PageController _controller = PageController();

  bool paypalvalue = false;

  bool payoneervalue = false;

  bool visavalue = false;

  final List _cardcolor = [Color(0xff1C6BA4),Color(0xffE09F1F),Color(0xffF5E1E9)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 40.h, bottom: 35.h),
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
                  'Payment Method',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff0E1012)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 150.h,
                width: 360.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: 20.w),
                      child: Container(
                      height: 150.h,
                      width: 290.w,
                      decoration: BoxDecoration(
                          color: _cardcolor[index],
                          borderRadius: BorderRadius.circular(24.r)),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 20.w,top: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text('Available balance',
                                   style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NunitoSans',
                                  color: Color(0xffFFFFFF)),
                                  ),
                                  SizedBox(width: 80.w,),
                                  Image.asset(AssetsManager.visacardimage)
                                ],),
                                SizedBox(height: 5.h,),
                                Text('3,578.99',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'NunitoSans',
                                  color: Color(0xffFFFFFF)),
                                ),
                                 SizedBox(height: 25.h,),
                                Text('5172 4567 8888 0000',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NunitoSans',
                                  color: Color(0xffD7DEEA)),
                                )
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
          SizedBox(
            height: 25.h,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: SlideEffect(
              activeDotColor: Color(0xff1C6BA4),
              dotHeight: 8,
              //dotColor: Colors.white,
              dotWidth: 8,
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, right: 28.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select Option',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NunitoSans',
                        color: Color(0xff0E1012)),
                  ),
                ),
                SizedBox(height: 35.h,),
                Row(
                  children: [
                    Checkbox(
                        value: paypalvalue,
                        activeColor: Color(0xff1C6BA4),
                        onChanged: ((newvalue) {
                          setState(() {
                            paypalvalue = newvalue!;
                          });
                        }),),
                        Image.asset(AssetsManager.paypalimage)
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    Checkbox(
                        value: payoneervalue,
                        activeColor: Color(0xff1C6BA4),
                        onChanged: ((newvalue) {
                          setState(() {
                            payoneervalue = newvalue!;
                          });
                        }),),
                        Image.asset(AssetsManager.payoneerimage)
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    Checkbox(
                        value: visavalue,
                        activeColor: Color(0xff1C6BA4),
                        onChanged: ((newvalue) {
                          setState(() {
                            visavalue = newvalue!;
                          });
                        }),),
                        Image.asset(AssetsManager.visaimage)
                  ],
                ),
                SizedBox(height: 60.h,),
                MaterialButton(
                      onPressed: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(),));
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
                            fontSize: 14.sp,
                            color: Color(0xffFFFFFF),
                            fontFamily: 'NunitoSans'),
                      ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
 



