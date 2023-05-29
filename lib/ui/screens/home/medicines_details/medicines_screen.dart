import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/ui/screens/home/medicines_details/add_cart_screen.dart';
import 'package:medical_app/ui/screens/home/medicines_details/products_details.dart';
import '../../../../resources/resources.dart';
import '../../../../services/auth_services.dart';
import '../home_screen.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    int medicinetype = 0;
    Future<void> selectCategory(index) async {
     setState(() {
      medicinetype = index;
       });
    }

    final List categoryText = [
      'General',
      'Covid Essential',
      'Skin Desieses',
      'Vitamins',
      'Essential',
    ];
    final AuthServices auth = AuthServices();
    final List image = [
      AssetsManager.pills,
      AssetsManager.syrup,
      AssetsManager.aciditypills,
      AssetsManager.livpills,
      AssetsManager.oxitardpill,
      AssetsManager.syrup,
      AssetsManager.pills,
      AssetsManager.syrup,
      AssetsManager.aciditypills,
      AssetsManager.livpills,
      AssetsManager.oxitardpill,
      AssetsManager.syrup,
    ];
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
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
                  width: 85.w,
                ),
                Text(
                  StringManager.medicine,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: ColorManager.darkblack,
                  ),
                ),
                buildSizedBoxSpacer(
                  width: 75.w,
                ),
                GestureDetector(
                   onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const AddCartScreen(),
                          ),
                        );
                      },
                  child: Container(
                    height: 38.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: ColorManager.bordercolor),
                    ),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: ColorManager.darkblue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 20.h, left: 0.w, bottom: 0.w),
          //   child: SizedBox(
          //     height: 40.h,
          //     width: double.infinity,
          //     child: ListView.builder(
          //       physics: const BouncingScrollPhysics(),
          //       itemCount: categoryText.length,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: index == 0
          //               ? EdgeInsets.only(left: 25.w, right: 10.w)
          //               : EdgeInsets.only(right: 10.w),
          //           child: GestureDetector(
          //             onTap: () => selectCategory(index),
          //             child: Container(
          //               height: 20.h,
          //               width: 80.w,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(12.w),
          //                 color: medicinetype == index
          //                     ? ColorManager.darkblue
          //                     : ColorManager.white,
          //                 border: Border.all(color: ColorManager.bordercolor),
          //               ),
          //               child: Padding(
          //                 padding: EdgeInsets.only(left: 5.w),
          //                 child: Center(
          //                   child: Text(
          //                     categoryText[index],
          //                     style: regularTextStyle(
          //                         color: medicinetype == index
          //                             ? ColorManager.white
          //                             : ColorManager.black,
          //                         fontSize: 13.sp,
          //                         fontWeight: medicinetype == index
          //                             ? FontWeight.bold
          //                             : FontWeight.normal),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 28.w, right: 28.w, top: 15.h, bottom: 0.h),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.5.h,
                ),
                itemCount: image.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsDetails(
                              image: image[index], index: index.toString()),
                        ),
                      );
                    },
                    child: Container(
                      height: 250.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        border: Border.all(color: ColorManager.bordercolor),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 115.h,
                            width: 148.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.w),
                                  topRight: Radius.circular(20.w)),
                              child: Image.asset(
                                image[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.w, left: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nepa Extra',
                                  style: regularTextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,),
                                ),
                                //buildSizedBoxSpacer(height: 3.h),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: ColorManager.darkyellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: ColorManager.darkyellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: ColorManager.darkyellow,
                                      size: 12.h,
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: ColorManager.darkyellow,
                                      size: 12.h,
                                    )
                                  ],
                                ),

                                // Text(
                                //   '25 mg , 12 pills',
                                //   style: regularTextStyle(
                                //       fontSize: 12.sp,
                                //       color: ColorManager.textcolor),
                                // ),
                                //buildSizedBoxSpacer(height: 3.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$ 20',
                                      style: regularTextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 5.w, bottom: 5.w, left: 60.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection('cart')
                                              .doc(auth.getUser()!.uid)
                                              .collection("products")
                                              .doc()
                                              .set({
                                            'image': image[index].toString(),
                                            'name': 'Nepa Extra',
                                            'prize': '\$20',
                                            'quantity': 1,
                                            'pid': index,
                                            'uid': auth.getUser()!.uid
                                          });
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddCartScreen(
                                                image: image[index],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 30.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                            color: ColorManager.darkblue,
                                            borderRadius:
                                                BorderRadius.circular(19.w),
                                            border: Border.all(
                                                color: ColorManager.darkblue),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: ColorManager.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
