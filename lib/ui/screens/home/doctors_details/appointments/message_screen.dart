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
import 'package:grouped_list/grouped_list.dart';

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
  ScrollController _scontroller = ScrollController();
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
    setState(() {});
  }

  Future<void> downloadURLExample() async {
    String filename = Uuid().v1();
    final ref =
        FirebaseStorage.instance.ref().child('images').child("$filename.jpg");
    var uploadTask = await ref.putFile(_imagefile!);
    url = await uploadTask.ref.getDownloadURL();
    if (url != null) {
      await _collection.doc(filename).set({
        'messagecontent': url,
        'messagetype': 'sender',
        // 'receiver',
        'type': 'img',
        'time': DateTime.now(),
        'uid': _auth.getUser()!.uid
      });
      setState(() {});
    }
    setState(() {});
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgcolor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: ColorManager.white,
              title: _doctorProfile(
                  context, widget.populardoctorimage, widget.doctorname))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 560.h,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _chat(_scontroller),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: _sendmessage(_controller, _scontroller)),
          ],
        ),
      ),
    );
  }

  Widget _doctorProfile(BuildContext context, populardoctorimage, doctorname) =>
      Container(
        height: 80.h,
        width: 450.w,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.h, right: 15.w),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: ColorManager.darkblack,
                  size: 25.h,
                ),
              ),
            ),
            Container(
                height: 45.h,
                width: 40.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
                child: populardoctorimage),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 23.h),
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
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // buildSizedBoxSpacer(width: 110.w),
            // Image.asset(AssetsManager.vediocall)
          ],
        ),
      );

  Widget _sendmessage(controller, scontroller) => Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50.h,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.white,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: GestureDetector(
                          onTap: () async {
                            await _takephoto();
                          },
                          child: Icon(
                            Icons.photo,
                            color: ColorManager.darkblue,
                            size: 20.h,
                          )),
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          if (controller.text.trim().isNotEmpty) {
                            setState(() {
                              _collection.doc().set({
                                'messagecontent':
                                    //controller.text != null ? controller.text : url,
                                    controller.text,
                                'messagetype': 'sender',
                                // 'receiver',
                                'type': 'mesg',
                                'time': FieldValue.serverTimestamp(),
                                'uid': _auth.getUser()!.uid
                              });
                              controller.clear();
                            });
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: ColorManager.darkblue,
                          size: 20.h,
                        )),
                    hintText: StringManager.writehere,
                    hintStyle: regularTextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.thucolor),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                          BorderSide(color: ColorManager.textfeildbordercolor),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                            color: ColorManager.textfeildbordercolor)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

Widget _chat(scontroller) => Column(
      children: [
        SizedBox(
          //height: 700.h,
          //width: double.infinity,
          child: StreamBuilder(
            stream: _collection.orderBy('time').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  //reverse: true,
                  shrinkWrap: true,
                  controller: scontroller,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    //sDocumentSnapshot doc = snapshot.data!.docs.elementAt(index);
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
                              child: Container(
                                height: 150.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                    width: 2,
                                    color: snapshot.data!.docs[index]
                                                ['messagetype'] ==
                                            "sender"
                                        ? ColorManager.darkblue
                                        : ColorManager.lightyellow,
                                  ),
                                  color: snapshot.data!.docs[index]
                                              ['messagetype'] ==
                                          "sender"
                                      ? ColorManager.darkblue
                                      : ColorManager.lightyellow,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.r),
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
