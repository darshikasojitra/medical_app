import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../../services/auth_services.dart';
import '../../../dashboard_screen.dart';

class MessageScreen extends StatefulWidget {
  static const String id = 'MessageScreen';
  final Image populardoctorimage;
  final String doctorname;
  const MessageScreen(
      {super.key, required this.populardoctorimage, required this.doctorname});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

final AuthServices _auth = AuthServices();
var _collection = FirebaseFirestore.instance
    .collection('chat')
    .doc(_auth.getUser()!.uid)
    .collection("messages");

class _MessageScreenState extends State<MessageScreen> {
  File? _imagefile;
  PickedFile? pickedFile;
  final ImagePicker _picker = ImagePicker();
  String? url;
  Future<void> _takephoto() async {
    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        _imagefile = File(xFile.path);
        downloadURLExample();
      }
    });
  }

  Future<void> downloadURLExample() async {
    String filename = Uuid().v1();
    final ref =
        FirebaseStorage.instance.ref().child('images').child("$filename.jpg");
    var uploadTask = await ref.putFile(_imagefile!);
    url = await uploadTask.ref.getDownloadURL();
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _doctorProfile(
                context, widget.populardoctorimage, widget.doctorname),
            buildSizedBoxSpacer(
              height: 0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 550.h,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _chat(url),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: _sendmessage(
                  _controller,
                )),
          ],
        ),
      ),
    );
  }

  Widget _doctorProfile(BuildContext context, populardoctorimage, doctorname) =>
      Container(
        height: 80.h,
        width: 450.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              spreadRadius: 7,
              offset: const Offset(0, 2),
              color: ColorManager.shadowcolor,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 20.h),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      )),
                  child: Icon(
                Icons.arrow_back_rounded,
                size: 25.h,
              )),
              buildSizedBoxSpacer(
                width: 15.w,
              ),
              Container(
                  height: 44.h,
                  width: 40.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
                  child: populardoctorimage),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorname,
                      style: regularTextStyle(
                        color: ColorManager.darkblack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          StringManager.activenow,
                          style: regularTextStyle(
                            color: ColorManager.settingiconcolor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        buildSizedBoxSpacer(
                          width: 5.w,
                        ),
                        Container(
                          height: 7.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                              color: ColorManager.green,
                              borderRadius: BorderRadius.circular(7.r)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              buildSizedBoxSpacer(width: 110.w),
              Image.asset(AssetsManager.vediocall)
            ],
          ),
        ),
      );

  Widget _sendmessage(controller) => Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h),
        height: 50.h,
        width: 340.w,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.white,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: GestureDetector(
                onTap: () async {
                  await _takephoto();
                },
                child: Image.asset(
                  AssetsManager.linkdataimage,
                ),
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: GestureDetector(
                  onTap: () async {
                    if(controller !=null){
                       setState(() {
                      _collection.doc().set({
                        'messagecontent': url ?? controller.text,
                        'messagetype':'sender',
                        // 'receiver',
                        'type': url != null ? 'img' : 'mesg',
                        'time': DateTime.now(),
                        'uid': _auth.getUser()!.uid
                      });
                      controller.clear();
                    });
                    }
                   
                  },
                  child: Image.asset(AssetsManager.sendimage)),
            ),
            hintText: StringManager.writehere,
            hintStyle: regularTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ColorManager.thucolor),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.textfeildbordercolor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide:
                    BorderSide(color: ColorManager.textfeildbordercolor)),
          ),
        ),
      );
}

Widget _chat(url) => Column(
      children: [
        SizedBox(
          height: 600.h,
          width: 350.w,
          child: StreamBuilder(
            stream: _collection.orderBy('time').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  reverse: false,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    //DocumentSnapshot doc = snapshot.data!.docs.elementAt(index);
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 15.h, left: 10.w, right: 10.w, bottom: 5.h),
                      child: snapshot.data?.docs[index]['type'] == 'img'
                          ? Align(
                              alignment: snapshot.data!.docs[index]
                                          ['messagetype'] ==
                                      "sender"
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: ClipPath(
                                clipper: snapshot.data!.docs[index]
                                            ['messagetype'] ==
                                        "sender"
                                    ? LowerNipMessageClipper(MessageType.send)
                                    : UpperNipMessageClipper(
                                        MessageType.receive),
                                child: Container(
                                  height: 100.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: snapshot.data!.docs[index]
                                                ['messagetype'] ==
                                            "sender"
                                        ? ColorManager.darkblue
                                        : ColorManager.lightyellow,
                                  ),
                                  child: Image.network(
                                    snapshot.data?.docs[index]
                                        ['messagecontent'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: snapshot.data!.docs[index]
                                          ['messagetype'] ==
                                      "sender"
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: ClipPath(
                                clipper: snapshot.data!.docs[index]
                                            ['messagetype'] ==
                                        "sender"
                                    ? LowerNipMessageClipper(MessageType.send)
                                    : UpperNipMessageClipper(
                                        MessageType.receive),
                                child: Container(
                                  height: 65.h,
                                  width: 235.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: snapshot.data!.docs[index]
                                                ['messagetype'] ==
                                            "sender"
                                        ? ColorManager.darkblue
                                        : ColorManager.lightyellow,
                                  ),
                                  child: Padding(
                                    padding: snapshot.data!.docs[index]
                                                ['messagetype'] ==
                                            "sender"
                                        ? EdgeInsets.only(
                                            left: 10.w,
                                            top: 10.h,
                                            right: 20.w,
                                            bottom: 10.h)
                                        : EdgeInsets.only(
                                            left: 20.w,
                                            top: 15.h,
                                            right: 20.w,
                                            bottom: 10.h),
                                    child: Text(
                                      snapshot.data?.docs[index]
                                          ['messagecontent'],
                                      style: snapshot.data!.docs[index]
                                                  ['messagetype'] ==
                                              "sender"
                                          ? regularTextStyle(
                                              color: ColorManager.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : regularTextStyle(
                                              color: ColorManager.textcolor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
