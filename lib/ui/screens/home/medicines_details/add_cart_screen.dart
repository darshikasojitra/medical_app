import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/home/medicines_details/products_details.dart';

class AddCartScreen extends StatelessWidget {
  final String? image;
  const AddCartScreen({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    final AuthServices auth = AuthServices();
    var documentID = '';
    var cart = FirebaseFirestore.instance
        .collection('cart')
        .doc(auth.getUser()?.uid)
        .collection("products");
    var _total = 0;

    Future<void> _addtotal() async {
      _total = _total + 20;
      print(_total);
    }

    Future<void> add(doc) async {
      await cart
          .where('uid', isEqualTo: auth.getUser()?.uid)
          .where('pid', isEqualTo: doc['pid'])
          .get()
          .then((QuerySnapshot snapshot) => {
                snapshot.docs.forEach((element) {
                  documentID = element.reference.id;
                }),
                cart.doc(documentID).update({
                  'quantity': doc['quantity'] + 1,
                })
              });
    }

    Future<void> remove(doc) async {
      if (doc['quantity'] > 0) {
        await cart
            .where('uid', isEqualTo: auth.getUser()?.uid)
            .where('pid', isEqualTo: doc['pid'])
            .get()
            .then((QuerySnapshot snapshot) => {
                  snapshot.docs.forEach((element) {
                    documentID = element.reference.id;
                  }),
                  cart
                      .doc(documentID)
                      .update({'quantity': doc['quantity'] - 1}),
                });
      }
    }

    return Scaffold(
      body: Column(
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
                  'My Cart',
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
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: SizedBox(
              height: 565.h,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('cart')
                    .doc(auth.getUser()?.uid)
                    .collection("products")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var doc = snapshot.data?.docs.elementAt(index);
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Container(
                            height: 120.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.w),
                              border:
                                  Border.all(color: ColorManager.bordercolor),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 120.h,
                                  width: 140.w,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.w),
                                          bottomLeft: Radius.circular(20.w)),
                                      child: Image.asset(
                                        doc!['image'],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doc['name'],
                                        style: regularTextStyle(
                                            fontSize: 17.sp,
                                            color: ColorManager.darkblack,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        doc['prize'],
                                        style: regularTextStyle(
                                            fontSize: 14.sp,
                                            color:
                                                ColorManager.settingiconcolor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductsDetails(
                                                        image: doc['image'],
                                                        index:
                                                            index.toString()),
                                              ),
                                            );
                                          },
                                          child: Text('View Details',style: regularTextStyle(fontSize: 13.sp,color: ColorManager.darkblue,fontWeight: FontWeight.bold),)),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 13.h,
                                            right: 8.w,
                                            left: 50.w,
                                            bottom: 8.h),
                                        child: Container(
                                          height: 30.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.w),
                                            border: Border.all(
                                                color:
                                                    ColorManager.bordercolor),
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                  onTap: () => remove(doc),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color:
                                                        ColorManager.darkblue,
                                                  )),
                                              buildSizedBoxSpacer(width: 24.w),
                                              Text(
                                                doc['quantity'].toString(),
                                                style: regularTextStyle(
                                                    color:
                                                        ColorManager.darkblue,
                                                    fontSize: 15.sp),
                                              ),
                                              buildSizedBoxSpacer(width: 20.w),
                                              GestureDetector(
                                                  onTap: () {
                                                    _addtotal();
                                                    add(doc);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color:
                                                        ColorManager.darkblue,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          // Container(
          //   height: 47.h,
          //   width: double.infinity,
          //   color: ColorManager.white,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [Text('Total : $_total')],
          //   ),
          // )
        ],
      ),
    );
  }
}
