import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/dashboard_screen.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/message_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../../widgets/common_widget/common_widget.dart';
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
    Image.asset(AssetsManager.paypalimage),
    Image.asset(AssetsManager.payoneerimage),
    Image.asset(AssetsManager.visaimage)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 40.h, bottom: 0.h),
            child: _appBar(context),
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              _creditCard(
                _controller,
                _cardcolor,
                _auth,
              ),
              _continueButton(context),
            ],
          )),
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

Widget _creditCard(
  controller,
  cardcolor,
  _auth,
) =>
    Container(
      height: 550.h,
      width: double.infinity,
      //color: Colors.blue,
      child: Container(
        height: 150.h,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('payment')
              .doc(_auth.getUser()!.uid)
              .collection('cardinfo')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Container(
                    height: 150.h,
                    padding: EdgeInsets.only(bottom: 0.h, top: 20.h),
                    child: _addcard(
                      context,
                    ));
              } else {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length + 1,
                  controller: controller,
                  itemBuilder: (context, index) {
                    if (index == snapshot.data!.docs.length) {
                      return _addcard(
                        context,
                      );
                    } else {
                      DocumentSnapshot doc =
                          snapshot.data!.docs.elementAt(index);
                      doc.id;
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, bottom: 20.h, right: 20.w),
                        child: Container(
                          height: 150.h,
                          width: 290.w,
                          decoration: BoxDecoration(
                              color: ColorManager.darkblue,
                              //cardcolor[index],
                              borderRadius: BorderRadius.circular(24.r)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        height: 20.h,
                                        width: 80.w,
                                        //color: Colors.white,
                                        child: Image.asset(
                                            doc['type'].toString())),
                                  ),
                                ),
                                Text(
                                  StringManager.accountnumber,
                                  style: regularTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.balancetextcolor),
                                ),
                                buildSizedBoxSpacer(
                                  height: 8.h,
                                ),
                                Text(
                                  '**** **** **** ' +
                                      (doc['cardno']).substring(
                                          (doc['cardno']).length - 4),
                                  style: regularTextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.white),
                                ),
                                buildSizedBoxSpacer(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringManager.accountholdername,
                                          style: regularTextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: ColorManager.numcolor),
                                        ),
                                        Text(
                                          doc['name'],
                                          style: regularTextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.numcolor),
                                        ),
                                      ],
                                    ),
                                    buildSizedBoxSpacer(width: 80.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringManager.expdate,
                                          style: regularTextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: ColorManager.numcolor),
                                        ),
                                        Text(
                                          doc['expdate'],
                                          style: regularTextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.numcolor),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
Widget _continueButton(context) => Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: CustomButtons(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ))
        },
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
    );

Widget _addcard(
  context,
) =>
    Column(
      children: [
        DottedBorder(
          color: ColorManager.darkblue,
          borderType: BorderType.RRect,
          strokeWidth: 2,
          radius: Radius.circular(24.r),
          dashPattern: [10, 5, 10, 5, 10, 5],
          child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 150.h,
            width: 300.w,
            decoration: BoxDecoration(
                //color: ColorManager.white,
                borderRadius: BorderRadius.circular(24.r)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNewPaymentcard(),
                      ));
                },
                child: Container(
                  height: 90.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: ColorManager.searchcolor,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Icon(
                    Icons.add,
                    size: 50.sp,
                    color: ColorManager.darkblue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
