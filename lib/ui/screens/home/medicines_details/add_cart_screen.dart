import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/home/medicines_details/products_details.dart';
import 'cart_details/bottom_container.dart';

class AddCartScreen extends StatefulWidget {
  final String? image;
  const AddCartScreen({super.key, this.image});

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

final AuthServices auth = AuthServices();
class _AddCartScreenState extends State<AddCartScreen> {
  var documentID = '';
  var que=0;
   final _checkout = FirebaseFirestore.instance
      .collection('cart')
      .doc(auth.getUser()?.uid)
      .collection('checkout');
  final _cart = FirebaseFirestore.instance
      .collection('cart')
      .doc(auth.getUser()?.uid)
      .collection('products');
        
  var _total = 20;
  var _quantity = 1;
  Future<void> _add(doc, int price) async {
    setState(() {
      _total = _total + price;
      _quantity = _quantity + 1;
      _checkout
          .doc(auth.getUser()?.uid)
          .set({'total': _total, 'total_quantity': _quantity});
      _cart
          .where('uid', isEqualTo: auth.getUser()?.uid)
          .where('pid', isEqualTo: doc['pid'])
          .get()
          .then((QuerySnapshot snapshot) => {
                snapshot.docs.forEach((element) {
                  documentID = element.reference.id;
                }),
                _cart.doc(documentID).update({
                  'quantity': doc['quantity'] + 1,
                })
              });
    });
  }

  Future<void> _remove(doc, int price) async {
    setState(() {
      if (_total > 0 || _quantity>0) {
        _total = _total - price;
         _quantity = _quantity -1;
        _checkout.doc(auth.getUser()?.uid).set({'total': _total,'total_quantity': _quantity});
      }
      if (doc['quantity'] > 0) {
        _cart
            .where('uid', isEqualTo: auth.getUser()?.uid)
            .where('pid', isEqualTo: doc['pid'])
            .get()
            .then((QuerySnapshot snapshot) => {
                  snapshot.docs.forEach((element) {
                    documentID = element.reference.id;
                  }),
                  _cart
                      .doc(documentID)
                      .update({'quantity': doc['quantity'] - 1}),
                });
      }
    });
  }
Future<void> removecard(
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        int index,doc) async {
          if (_total > 0 || _quantity>0) {
             _cart
          .where('uid', isEqualTo: auth.getUser()?.uid)
          .where('pid', isEqualTo: doc['pid'])
          .get()
          .then((QuerySnapshot snapshot) => {
                snapshot.docs.forEach((element) {
                  documentID = element.reference.id;
                }),
                _cart.doc(documentID).update({
                  'quantity': _quantity - doc['quantity'],
                })
              });
          }
         _cart
          .doc(snapshot.data?.docs[index].id)
          .delete();
    }
  @override
  Widget build(BuildContext context) {
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
                                        bottomLeft: Radius.circular(20.w),
                                      ),
                                      child: Image.asset(
                                        doc!['image'],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 0.h, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            doc['name'],
                                            style: regularTextStyle(
                                                fontSize: 17.sp,
                                                color: ColorManager.darkblack,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          buildSizedBoxSpacer(width: 30.w),
                                          PopupMenuButton(
                                            icon: Image.asset(
                                              AssetsManager.vertical3dotsimage,
                                              color: ColorManager.searchiconcolor,
                                              height: 15.h,
                                            ),
                                            position: PopupMenuPosition.under,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5.sp)),
                                            onSelected: (value) {},
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                  onTap: () {
                                                    removecard(snapshot, index,doc);
                                                  },
                                                  value: '/remove',
                                                  child: const Text('Remove'),
                                                )
                                              ];
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$ ${(doc['price'].toString())}',
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
                                          child: Text(
                                            'View Details',
                                            style: regularTextStyle(
                                                fontSize: 13.sp,
                                                color: ColorManager.darkblue,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h,
                                            right: 8.w,
                                            left: 50.w,
                                            bottom: 5.h),
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
                                                  onTap: () => _remove(
                                                      doc, doc['price']),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color:
                                                        ColorManager.darkblue,
                                                  )),
                                              buildSizedBoxSpacer(width: 18.w),
                                              Text(
                                                doc['quantity'].toString(),
                                                style: regularTextStyle(
                                                    color:
                                                        ColorManager.darkblue,
                                                    fontSize: 15.sp),
                                              ),
                                              buildSizedBoxSpacer(width: 18.w),
                                              GestureDetector(
                                                onTap: () {
                                                  _add(doc, doc['price']);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: ColorManager.darkblue,
                                                ),
                                              ),
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
          const BottomContainer(),
          // Container(
          //   height: 47.h,
          //   width: double.infinity,
          //   color: ColorManager.white,
          //   child: Row(
          //     //mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         'total: $_total',
          //       ),
          //       buildSizedBoxSpacer(width: 180.w),
          //       CustomButtons(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const CheckoutScreen(),
          //             ),
          //           );
          //         },
          //         color: ColorManager.darkblue,
          //         child: Text(
          //           'Checkout',
          //           style: regularTextStyle(
          //               color: ColorManager.white, fontSize: 14.sp),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
