import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/medicines_details/cart_details/checkout/change_address.dart';

import '../../../../../../resources/resources.dart';
import '../../../home_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthServices auth = AuthServices();
    final address = FirebaseFirestore.instance
                  .collection('Address')
                  .doc(auth.getUser()!.uid)
                  .collection("new");
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 40.h, bottom: 0.h),
            child: Row(
              children: [
                Container(
                  height: 38.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: ColorManager.bordercolor),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(AssetsManager.arrowimage),
                  ),
                ),
                buildSizedBoxSpacer(
                  width: 80.w,
                ),
                Text(
                  'Checkout',
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: ColorManager.darkblack,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 20.h),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeAddress(),
                    ),
                  );
                },
                child: Text(
                  'Add Address +',
                  style: regularTextStyle(
                      fontSize: 13.sp,
                      color: ColorManager.darkblue,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 100.h,
            width: double.infinity,
            //color: Colors.blue,
            child: StreamBuilder(
              stream: address
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No Address'),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc =
                          snapshot.data!.docs.elementAt(index);
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 25.w, top: 15.h, right: 25.w),
                        child: Row(
                          children: [
                            doc['typeofaddress'] == 'home'
                                ? Icon(
                                    Icons.home_outlined,
                                    size: 20.h,
                                    color: ColorManager.settingiconcolor,
                                  )
                                : Icon(
                                    Icons.work_outlined,
                                    size: 20.h,
                                    color: ColorManager.settingiconcolor,
                                  ),
                            buildSizedBoxSpacer(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Deliver to ${doc['typeofaddress']}',
                                        style: regularTextStyle(
                                            fontSize: 13.sp,
                                            color:
                                                ColorManager.settingiconcolor),
                                      ),
                                      buildSizedBoxSpacer(width: 110.w),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangeAddress(
                                                fullname: doc['fullname'],
                                                phnno: doc['phnno'],
                                                pincode: doc['pincode'],
                                                state: doc['state'],
                                                city: doc['city'],
                                                type: doc['typeofaddress'],
                                                address1: doc['address1'],
                                                address2: doc['address2'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Change',
                                          style: regularTextStyle(
                                              color: ColorManager.darkblue,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: 250.w,
                                    child: Text(
                                        "${doc['address1'] + ', ' + doc['city'] + ', ' + doc['state']}")),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.bordercolor),
                  borderRadius: BorderRadius.circular(16.w),),
                  child: Column(
                    children: [
                      Text('Order Summary')
                    ],
                  ),
            ),
          )
        ],
      ),
    );
  }
}
