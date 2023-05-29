import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';

import '../../../../resources/resources.dart';
import '../../../../services/auth_services.dart';
import '../home_screen.dart';
import 'add_cart_screen.dart';

class ProductsDetails extends StatelessWidget {
  final String? image;
  final String? index;
  const ProductsDetails({super.key, this.image, this.index});

  @override
  Widget build(BuildContext context) {
    final AuthServices auth = AuthServices();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 35.h),
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
                  'Products Details',
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
            padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.w),
            child: Container(
              height: 200.h,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.bordercolor,
                ),
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.w),
                child: Image.asset(
                  image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          buildSizedBoxSpacer(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nepa Extra',
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      color: ColorManager.darkblack,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '25 mg , 12 pills',
                  style: regularTextStyle(
                      fontSize: 14.sp,
                      color: ColorManager.settingiconcolor,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$20',
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      color: ColorManager.settingiconcolor,
                      fontWeight: FontWeight.w400),
                ),
                buildSizedBoxSpacer(height: 20.h),
                Text(
                  'Manufacture BY',
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      color: ColorManager.darkblack,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Sanzyme Ltd.',
                  style: regularTextStyle(
                      fontSize: 14.sp,
                      color: ColorManager.settingiconcolor,
                      fontWeight: FontWeight.w400),
                ),
                buildSizedBoxSpacer(height: 20.h),
                Text(
                  'Description',
                  style: regularTextStyle(
                      fontSize: 20.sp,
                      color: ColorManager.darkblack,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Nepa Extra pills are a type of medication commonly used for relieving symptoms of gastrointestinal disorders such as acidity, bloating, and indigestion. They work by neutralizing excess stomach acid and providing quick relief from discomfort.',
                  style: regularTextStyle(
                      fontSize: 13.sp,
                      color: ColorManager.settingiconcolor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, bottom: 15.h, top: 50.h),
            child: CustomButtons(
              height: 46.h,
              minWidth: double.infinity,
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('cart')
                    .doc(auth.getUser()!.uid)
                    .collection("products")
                    .doc()
                    .set({
                  'image': image.toString(),
                  'name': 'Nepa Extra',
                  'prize': '\$20',
                  'quantity': 1,
                  'pid': index,
                  'uid': auth.getUser()!.uid
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCartScreen(),
                  ),
                );
              },
              color: ColorManager.darkblue,
              child: Text(
                'Add To Cart',
                style: regularTextStyle(
                    color: ColorManager.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
          )
        ],
      ),
    );
  }
}
