import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';

class AddNewPaymentcard extends StatefulWidget {
  const AddNewPaymentcard({super.key});

  @override
  State<AddNewPaymentcard> createState() => _AddNewPaymentcardState();
}

class _AddNewPaymentcardState extends State<AddNewPaymentcard> {
  final AuthServices _auth = AuthServices();
  String? selectedImage;
  final _fromKey = GlobalKey<FormState>();
  FocusNode cardnamefocusnode = FocusNode();
  FocusNode cardnofocusnode = FocusNode();
  FocusNode blancefocusnode = FocusNode();
  FocusNode expdatefocusnode = FocusNode();
  FocusNode cvvnofocusnode = FocusNode();
  final ScrollController _scrollcontroller = ScrollController();
  TextEditingController cardname = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController blance = TextEditingController();
  TextEditingController expdate = TextEditingController();
  TextEditingController cvvnumber = TextEditingController();
  static bool? checkval = false;
  final List _images = [
    AssetsManager.paypal,
    AssetsManager.payoneer,
    AssetsManager.visaimage
  ];
  Future<void> _selectindex(int index) async {
    setState(() {
      selectedImage = _images[index];
    });
  }

  Future<void> _savedata() async {
    if (_fromKey.currentState!.validate()) {
      _addcardinfo();
      Navigator.pop(context);
    }
  }

  Future<void> _addcardinfo() async {
    FirebaseFirestore.instance.collection('payment').doc(_auth.getUser()!.uid).collection('cardinfo').doc().set({
      'cardno': cardnumber.text,
      'expdate': expdate.text,
      'cvvno': cvvnumber.text,
      'blance': blance.text,
      'type': cardname.text,
      'uid': _auth.getUser()!.uid,
    });
  }

  @override
  void initState() {
    super.initState();
    cardnamefocusnode = FocusNode();
    cardnamefocusnode.addListener(() {
      setState(() {});
    });
    cardnofocusnode = FocusNode();
    cardnofocusnode.addListener(() {
      setState(() {});
    });
    blancefocusnode = FocusNode();
    blancefocusnode.addListener(() {
      setState(() {});
    });
    cardnamefocusnode = FocusNode();
    cardnamefocusnode.addListener(() {
      setState(() {});
    });
    expdatefocusnode = FocusNode();
    expdatefocusnode.addListener(() {
      setState(() {});
    });
    cvvnofocusnode = FocusNode();
    cvvnofocusnode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    cardnamefocusnode.dispose();
    cardnofocusnode.dispose();
    expdatefocusnode.dispose();
    cvvnofocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollcontroller,
        child: SafeArea(
          child: Column(
            children: [
              appbar(context),
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 30.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 300.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            width: 90.w,
                            child: cardImage(index),
                          );
                        },
                      ),
                    ),
                    buildSizedBoxSpacer(height: 20.h),
                    Container(
                      height: 380.h,
                      width: 300.w,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: cardInfo(index),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              buildSizedBoxSpacer(height: 40.h),
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                height: 21.h,
                width: 27.w,
                child: Icon(
                  Icons.arrow_back,
                  size: 21.sp,
                ),
              ),
            ),
            buildSizedBoxSpacer(
              width: 8.w,
            ),
            Column(
              children: [
                Text(
                  'New payment method',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  style: regularTextStyle(
                      fontSize: 18.sp,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w800),
                ),
                buildSizedBoxSpacer(height: 5.h),
                Text(
                  'Choose your Payment Method',
                  style: regularTextStyle(
                      color: ColorManager.black, fontSize: 12.sp),
                )
              ],
            ),
          ],
        ),
      );

  Widget cardImage(int index) => GestureDetector(
        onTap: () => _selectindex(index),
        child: Container(
          height: 55.h,
          width: 60.w,
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          decoration: BoxDecoration(
            color: ColorManager.lightblue,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: selectedImage == _images[index]
                  ? ColorManager.green
                  : Colors.transparent,
              width: 2.w,
            ),
          ),
          child: Image.asset(
            _images[index].toString(),
          ),
        ),
      );

  Widget cardInfo(int index) => Container(
        //height: 320.h,
        width: 300.w,
        child: selectedImage == _images[index]
            ? Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    children: [
                      CustomTextFeild(
                        obscureText: false,
                        controller: cardname,
                        validator: Validator.cardnamevalidator,
                        focusNode: cardnamefocusnode,
                        hintText: cardnamefocusnode.hasFocus
                            ? 'Visa/PayPal/Payoneer'
                            : 'Card Type',
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: ColorManager.darkblue,
                            value: checkval,
                            onChanged: (value) {
                              setState(() {
                                checkval = value;
                              });
                            },
                          ),
                          const Text('Use name on account'),
                        ],
                      ),
                      CustomTextFeild(
                        obscureText: false,
                        controller: cardnumber,
                        focusNode: cardnofocusnode,
                        validator: Validator.cardnovalidator,
                        hintText: cardnofocusnode.hasFocus
                            ? 'XXXX XXXX XXXX XXXX'
                            : 'Card number',
                      ),
                      buildSizedBoxSpacer(height: 17.h),
                      CustomTextFeild(
                        obscureText: false,
                        controller: blance,
                        focusNode: blancefocusnode,
                        validator: Validator.nameValidator,
                        hintText: blancefocusnode.hasFocus
                            ? '${00000}'
                            : 'availlable blance',
                      ),
                      buildSizedBoxSpacer(height: 17.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomTextFeild(
                              //keyboardType: TextInputType.number,
                              obscureText: false,
                              controller: expdate,
                              focusNode: expdatefocusnode,
                              hintText: expdatefocusnode.hasFocus
                                  ? "10/29"
                                  : 'Expiry date',

                              validator: Validator.expdatevalidator,
                            ),
                          ),
                          buildSizedBoxSpacer(width: 8.w),
                          Flexible(
                            child: CustomTextFeild(
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              controller: cvvnumber,
                              focusNode: cvvnofocusnode,
                              hintText: cvvnofocusnode.hasFocus ? '477' : 'CCV',
                              validator: Validator.cvvnovalidator,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const Text(''),
      );

  Widget saveButton() => Padding(
        padding: EdgeInsets.all(30.h),
        child: MaterialButton(
          height: 40.h,
          minWidth: double.infinity,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          onPressed: () {
            _savedata();
          },
          color: ColorManager.darkblue,
          child: Text('Save',
              style:
                  regularTextStyle(fontSize: 16.sp, color: ColorManager.white)),
        ),
      );
}
