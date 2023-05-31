import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/medicines_details/cart_details/checkout/checkout_screen.dart';
import '../../../../../resources/resources.dart';
import '../../../../../widgets/common_widget/common_widget.dart';
import '../../home_screen.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthServices auth = AuthServices();
    final checkout = FirebaseFirestore.instance
        .collection('cart')
        .doc(auth.getUser()?.uid)
        .collection('checkout');
    return SizedBox(
      height: 47.h,
      child: StreamBuilder(
        stream: checkout.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data?.docs.elementAt(index);
                return Container(
                  //height: 47.h,
                  width: double.infinity,
                  color: ColorManager.white,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total : \$${(doc?['total']).toString()}',
                        style: regularTextStyle(
                            color: ColorManager.darkblack,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text((doc?['total_quantity']).toString(),),
                      buildSizedBoxSpacer(width: 150.w),
                      CustomButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(),
                            ),
                          );
                        },
                        color: ColorManager.darkblue,
                        child: Text(
                          'Checkout',
                          style: regularTextStyle(
                              color: ColorManager.white, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
