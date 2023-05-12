import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/message_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dotted_border/dotted_border.dart';

import 'addnewpaymentcard.dart';

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
  final AuthServices _auth = AuthServices();
  List checkListItems = [
    {"value": false, "label": Image.asset(AssetsManager.paypalimage)},
    {"value": false, "label": Image.asset(AssetsManager.payoneerimage)},
    {"value": false, "label": Image.asset(AssetsManager.visaimage)}
  ];
  String selected = "";
  bool paypalvalue = false;
  bool payoneervalue = false;
  bool visavalue = false;
  final List _cardcolor = [
    ColorManager.darkblue,
    ColorManager.darkyellow,
    ColorManager.darkpink,
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
          _creditCard(_controller, _cardcolor,_auth),
          buildSizedBoxSpacer(
            height: 25.h,
          ),
          // SmoothPageIndicator(
          //   controller: _controller,
          //   count: 3,
          //   effect: SlideEffect(
          //     activeDotColor: ColorManager.darkblue,
          //     dotHeight: 8,
          //     dotColor: ColorManager.dotcolor,
          //     dotWidth: 8,
          //   ),
          // ),
          buildSizedBoxSpacer(
            height: 45.h,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 15.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    StringManager.selectoption,
                    style: regularTextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.darkblack),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 28.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 180.h,
                    width: 240.w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: checkListItems.length,
                      itemBuilder: (context, index) {
                        return CustomCheckBox(
                          label: checkListItems[index]["label"],
                          padding: EdgeInsets.only(left: 0.w, bottom: 10.h),
                          value: checkListItems[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              for (var element in checkListItems) {
                                element["value"] = false;
                              }
                              checkListItems[index]["value"] = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              buildSizedBoxSpacer(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: CustomButtons(
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
              ),
            ],
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

Widget _creditCard(controller, cardcolor,_auth) => Container(
      height: 150.h,
      width: double.infinity,
      // color: Colors.blue,
      child: Row(
        children: [
          Container(
            height: 150.h,
            width: 360.w,
            child: StreamBuilder(
             stream:FirebaseFirestore.instance.collection('payment').doc(_auth.getUser()!.uid).collection('cardinfo').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return _addcard(context);
                  }else{
                  return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length + 1,
                controller: controller,
                itemBuilder: (context, index) {
                
                  if (index == snapshot.data!.docs.length) {
                    return _addcard(context);
                  } else {
                      DocumentSnapshot doc =
                            snapshot.data!.docs.elementAt(index);
                        doc.id;
                    return Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        height: 150.h,
                        width: 290.w,
                        decoration: BoxDecoration(
                            color: cardcolor[index],
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 10.w),
                                child: Align(alignment: Alignment.topRight,
                                  child: Text('${doc['type']}',
                                      style: regularTextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800,
                                            color: ColorManager.white),
                                      ),
                                ),
                              ),
                              Text(
                                StringManager.availablebalance,
                                style: regularTextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.balancetextcolor),
                              ),
                              buildSizedBoxSpacer(
                                height: 10.h,
                              ),
                              Text(
                               '\$ ${doc['blance']}',
                                style: regularTextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.white),
                              ),
                              buildSizedBoxSpacer(
                                height: 20.h,
                              ),
                              Text(
                                '**** **** **** ' +
                                                      (doc['cardno']).substring(
                                                          (doc['cardno'])
                                                                  .length -
                                                              4),
                                
                                //StringManager.text51750000,
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
                  }
                },
              );}
                }return const Center(child: CircularProgressIndicator());
              },
           
            ),
          ),
        ],
      ),
    );

    Widget _addcard(context) =>  Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: DottedBorder(
                        color: ColorManager.darkblue,
                        borderType: BorderType.RRect,
                        strokeWidth: 2,
                        radius: Radius.circular(24.r),
                        dashPattern: [10, 5, 10, 5, 10, 5],
                        child: Container(
                          height: 150.h,
                          width: 290.w,
                          decoration: BoxDecoration(
                              //color: ColorManager.white,
                              borderRadius: BorderRadius.circular(24.r)),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewPaymentcard(),));
                              },
                              child: Container(
                                height: 90.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: ColorManager.searchcolor,
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Icon(
                                  Icons.add,
                                  size: 50.sp,color: ColorManager.darkblue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
