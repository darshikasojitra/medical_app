import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appoinments/message_screen.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  final List _cardcolor = [
    ColorManager.darkblue,
    ColorManager.darkyellow,
    ColorManager.darkpink
  ];

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
                  StringManager.paymentmethod,
                  style: regularTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.darkblack),
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
                  physics:const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        height: 150.h,
                        width: 290.w,
                        decoration: BoxDecoration(
                            color: _cardcolor[index],
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    StringManager.availablebalance,
                                    style: regularTextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.white),
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  Image.asset(AssetsManager.visacardimage)
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                StringManager.text357899,
                                style: regularTextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.white),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Text(
                                StringManager.text51750000,
                                style: regularTextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.bordercolor),
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
            effect:  SlideEffect(
              activeDotColor: ColorManager.darkblue,
              dotHeight: 8,
              dotColor: ColorManager.dotcolor,
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
                    StringManager.selectoption,
                    style: regularTextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.darkblack),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: paypalvalue,
                      activeColor: ColorManager.darkblue,
                      onChanged: ((newvalue) {
                        setState(() {
                          paypalvalue = newvalue!;
                        });
                      }),
                    ),
                    Image.asset(AssetsManager.paypalimage)
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: payoneervalue,
                      activeColor: ColorManager.darkblue,
                      onChanged: ((newvalue) {
                        setState(() {
                          payoneervalue = newvalue!;
                        });
                      }),
                    ),
                    Image.asset(AssetsManager.payoneerimage)
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: visavalue,
                      activeColor: ColorManager.darkblue,
                      onChanged: ((newvalue) {
                        setState(() {
                          visavalue = newvalue!;
                        });
                      }),
                    ),
                    Image.asset(AssetsManager.visaimage)
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                CustomButtons(
                  onPressed: (() {
                    Navigator.pushNamed(context, MessageScreen.id);
                  }),
                  height: 46.h,
                  minWidth: double.infinity,
                  color: ColorManager.darkblue,
                  child: Text(
                    StringManager.Continue,
                    style: regularTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
