import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/message_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'PaymentScreen';
  final Image populardoctorimage;
  final String doctorname;
  const PaymentScreen(
      {super.key, required this.populardoctorimage, required this.doctorname});

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
  Future<void> _showMessageScreen() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessageScreen(
            populardoctorimage: widget.populardoctorimage,
            doctorname: widget.doctorname,
          ),
        ));
  }

  Future<void> _showPaypal(newvalue) async {
    setState(() {
      paypalvalue = newvalue;
    });
  }

  Future<void> _showPAyoneer(newvalue) async {
    setState(() {
      payoneervalue = newvalue;
    });
  }

  Future<void> _showVisa(newvisavalue) async {
    setState(() {
      visavalue = newvisavalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 40.h, bottom: 35.h),
            child: _appBar(context),
          ),
          Row(
            children: [
              _creditCard(_controller, _cardcolor),
            ],
          ),
          buildSizedBoxSpacer(
            height: 25.h,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: SlideEffect(
              activeDotColor: ColorManager.darkblue,
              dotHeight: 8,
              dotColor: ColorManager.dotcolor,
              dotWidth: 8,
            ),
          ),
          buildSizedBoxSpacer(
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
                buildSizedBoxSpacer(
                  height: 35.h,
                ),
                CustomCheckBox(
                  label: Image.asset(AssetsManager.paypalimage),
                  padding: EdgeInsets.only(left: 5.w),
                  value: paypalvalue,
                  onChanged: ((newvalue) => _showPaypal(newvalue)),
                ),
                buildSizedBoxSpacer(
                  height: 15.h,
                ),
                CustomCheckBox(
                  label: Image.asset(AssetsManager.payoneerimage),
                  padding: EdgeInsets.only(left: 5.w),
                  value: payoneervalue,
                  onChanged: ((newvalue) => _showPAyoneer(newvalue)),
                ),
                buildSizedBoxSpacer(
                  height: 15.h,
                ),
                CustomCheckBox(
                  label: Image.asset(AssetsManager.visaimage),
                  padding: EdgeInsets.only(left: 5.w),
                  value: visavalue,
                  onChanged: ((newvisavalue) => _showVisa(newvisavalue)),
                ),
                buildSizedBoxSpacer(
                  height: 60.h,
                ),
                CustomButtons(
                  onPressed: () => _showMessageScreen(),
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

Widget _appBar(context) => Row(
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
        buildSizedBoxSpacer(
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
    );

Widget _creditCard(controller, cardcolor) => SizedBox(
      height: 150.h,
      width: 360.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Container(
              height: 150.h,
              width: 290.w,
              decoration: BoxDecoration(
                  color: cardcolor[index],
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
                              color: ColorManager.balancetextcolor),
                        ),
                        buildSizedBoxSpacer(
                          width: 80.w,
                        ),
                        Image.asset(AssetsManager.visacardimage)
                      ],
                    ),
                    buildSizedBoxSpacer(
                      height: 5.h,
                    ),
                    Text(
                      StringManager.text357899,
                      style: regularTextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.white),
                    ),
                    buildSizedBoxSpacer(
                      height: 25.h,
                    ),
                    Text(
                      StringManager.text51750000,
                      style: regularTextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.numcolor),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
