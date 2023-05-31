import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/medicines_details/cart_details/checkout/checkout_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';
import 'package:medical_app/widgets/common_widget/commontextfeild.dart';
import '../../../home_screen.dart';

class ChangeAddress extends StatefulWidget {
  final String? fullname;
  final String? phnno;
  final String? pincode;
  final String? address1;
  final String? address2;
  final String? state;
  final String? city;
  final String? type;
  const ChangeAddress(
      {super.key,
      this.fullname,
      this.phnno,
      this.pincode,
      this.address1,
      this.address2,
      this.state,
      this.city,
      this.type});

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

final AuthServices auth = AuthServices();

class _ChangeAddressState extends State<ChangeAddress> {
  final _address = FirebaseFirestore.instance
      .collection('Address')
      .doc(auth.getUser()!.uid)
      .collection("new");
  var _documentID = '';
  final fromKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final phnnoController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final addressline1Controller = TextEditingController();
  final addressline2Controller = TextEditingController();
  final typeController = TextEditingController();
  void readName() async {
    if (widget.fullname != null) {
      fullnameController.text = widget.fullname as String;
      phnnoController.text = widget.phnno as String;
      pincodeController.text = widget.pincode as String;
      stateController.text = widget.state as String;
      cityController.text = widget.city as String;
      addressline1Controller.text = widget.address1 as String;
      addressline2Controller.text = widget.address2 as String;
      typeController.text = widget.type as String;
    }
  }

  @override
  void initState() {
    super.initState();
    readName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    'Add Address',
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
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.w),
              child: Form(
                key: fromKey,
                child: Column(
                  children: [
                    CustomTextFeild(
                      controller: fullnameController,
                      obscureText: false,
                      validator: Validator.nameValidator,
                      hintText: 'Enter Your Full Name',
                    ),
                    buildSizedBoxSpacer(height: 20.w),
                    IntlPhoneField(
                      flagsButtonPadding: EdgeInsets.only(left: 10.w),
                      dropdownIconPosition: IconPosition.trailing,
                      controller: phnnoController,
                      decoration: InputDecoration(
                        hintText: StringManager.enterphnno,
                        hintStyle: regularTextStyle(
                          color: ColorManager.settingiconcolor,
                          fontSize: 13.sp,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.bordercolor),
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.bordercolor),
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.bordercolor),
                            borderRadius: BorderRadius.circular(35.r)),
                      ),
                      initialCountryCode: 'IN',
                    ),
                    buildSizedBoxSpacer(height: 20.w),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 170.w),
                            child: CustomTextFeild(
                              controller: pincodeController,
                              obscureText: false,
                              validator: Validator.pincodeValidator,
                              hintText: 'Pincode',
                            ),
                          ),
                        ),
                        buildSizedBoxSpacer(height: 10.w),
                        // ElevatedButton(
                        //     onPressed: () {},
                        //     child: Row(
                        //       children: [
                        //         Icon(Icons.location_searching_sharp),
                        //         Text('Use my Location')
                        //       ],
                        //     ))
                      ],
                    ),
                    buildSizedBoxSpacer(height: 20.w),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomTextFeild(
                            controller: stateController,
                            obscureText: false,
                            validator: Validator.nameValidator,
                            hintText: 'State',
                          ),
                        ),
                        buildSizedBoxSpacer(width: 10.w),
                        Flexible(
                          child: CustomTextFeild(
                            controller: cityController,
                            obscureText: false,
                            validator: Validator.nameValidator,
                            hintText: 'city',
                          ),
                        ),
                      ],
                    ),
                    buildSizedBoxSpacer(height: 20.w),
                    CustomTextFeild(
                      controller: addressline1Controller,
                      obscureText: false,
                      validator: Validator.nameValidator,
                      hintText: 'Address line 1',
                    ),
                    buildSizedBoxSpacer(height: 20.w),
                    CustomTextFeild(
                      controller: addressline2Controller,
                      obscureText: false,
                      validator: Validator.nameValidator,
                      hintText: 'Address line 2',
                    ),
                    buildSizedBoxSpacer(height: 20.w),
                    CustomTextFeild(
                      controller: typeController,
                      obscureText: false,
                      validator: Validator.nameValidator,
                      labelText: 'Type of address',
                      hintText: 'Home/Work',
                    ),
                    buildSizedBoxSpacer(height: 50.w),
                    MaterialButton(
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          if (widget.fullname != null) {
                            _address.get().then((QuerySnapshot snapshot) => {
                                  snapshot.docs.forEach((element) {
                                    _documentID = element.reference.id;
                                  }),
                                  _address.doc(_documentID).update({
                                    'fullname': fullnameController.text,
                                    'phnno': phnnoController.text,
                                    'pincode': pincodeController.text,
                                    'state': stateController.text,
                                    'city': cityController.text,
                                    'address1': addressline1Controller.text,
                                    'address2': addressline2Controller.text,
                                    'typeofaddress': typeController.text,
                                    'uid': auth.getUser()!.uid
                                  }),
                                });
                          } else {
                            _address.doc().set({
                              'fullname': fullnameController.text,
                              'phnno': phnnoController.text,
                              'pincode': pincodeController.text,
                              'state': stateController.text,
                              'city': cityController.text,
                              'address1': addressline1Controller.text,
                              'address2': addressline2Controller.text,
                              'typeofaddress': typeController.text,
                              'uid': auth.getUser()!.uid
                            });
                          }
                          //`_address.where('index',isEqualTo: index)
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutScreen(),
                              ),
                              (route) => false);
                        }
                      },
                      color: ColorManager.darkblue,
                      height: 40.h,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Text(
                        "Save Address",
                        style: regularTextStyle(
                            color: ColorManager.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
