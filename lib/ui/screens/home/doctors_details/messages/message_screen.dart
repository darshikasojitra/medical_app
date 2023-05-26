import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/messages/vediocallscreen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/home/doctors_details/messages/components/image_message.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../../services/auth_services.dart';
import 'package:grouped_list/grouped_list.dart';

class MessageScreen extends StatefulWidget {
  static const String id = 'MessageScreen';
  final Image? populardoctorimage;
  final String doctorname;
  const MessageScreen({
    super.key,
    this.populardoctorimage,
    required this.doctorname,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

final AuthServices _auth = AuthServices();
var _collection = FirebaseFirestore.instance
    .collection('chat')
    .doc(_auth.getUser()!.uid)
    .collection("messages");

class _MessageScreenState extends State<MessageScreen> {
  final _scrollController = ScrollController();
  final _controller = TextEditingController();

  File? _imagefile;
  final _picker = ImagePicker();
  String? _url;
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
    _url = await uploadTask.ref.getDownloadURL();
    if (_url != null) {
      await _collection.doc(filename).set({
        'messagecontent': _url,
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
            context,
            widget.populardoctorimage,
            widget.doctorname,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.h, left: 80.w),
              child: StreamBuilder(
                stream: _collection.orderBy('time').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GroupedListView<
                        QueryDocumentSnapshot<Map<String, dynamic>>, String>(
                      elements: snapshot.data!.docs.reversed.toList(),
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      controller: _scrollController,
                      groupBy: (element) => '',
                      groupSeparatorBuilder: (String groupByValue) =>
                          Text(groupByValue),
                      useStickyGroupSeparators: false,
                      floatingHeader: false,
                      order: GroupedListOrder.ASC,
                      sort: false,
                      indexedItemBuilder: (context, element, index) {
                        final isSender = element['messagetype'] == "sender";
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 15.h, left: 10.w, right: 10.w, bottom: 5.h),
                          child: element['type'] == 'img'
                              ? ImageMessage(
                                  isSender: isSender,
                                  path: element['messagecontent'],
                                )
                              : Align(
                                  alignment: isSender
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: isSender
                                            ? Radius.circular(16.w)
                                            : Radius.zero,
                                        topRight: Radius.circular(16.w),
                                        bottomLeft: Radius.circular(16.w),
                                        bottomRight: isSender
                                            ? Radius.zero
                                            : Radius.circular(16.w),
                                      ),
                                      color: isSender
                                          ? ColorManager.darkblue
                                          : ColorManager.lightyellow,
                                    ),
                                    child: Text(
                                      element['messagecontent'],
                                      style: isSender
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
          ),
          _sendmessage(),
        ],
      ),
    );
  }

  Widget _doctorProfile(BuildContext context, populardoctorimage, doctorname) =>
      SizedBox(
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
            populardoctorimage == null
                ? CircleAvatar(
                    radius: 20.w,
                    backgroundColor: ColorManager.bordercolor,
                    child: Icon(
                      Icons.person,
                      color: ColorManager.darkblue,
                      size: 30.w,
                    ),
                  )
                : Container(
                    height: 45.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r)),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VedioCallScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 100.w, right: 10.w),
                child: Image.asset(
                  AssetsManager.vediocall,
                  height: 27.h,
                  width: 27.w,
                ),
              ),
            )
          ],
        ),
      );

  Widget _sendmessage() => Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
        child: TextFormField(
          controller: _controller,
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
                  if (_controller.text.trim().isNotEmpty) {
                    setState(() {
                      _collection.doc().set({
                        'messagecontent':
                            //controller.text != null ? controller.text : url,
                            _controller.text,
                        'messagetype': 'sender',
                        // 'receiver',
                        'type': 'mesg',
                        'time': FieldValue.serverTimestamp(),
                        'uid': _auth.getUser()!.uid
                      });
                      _controller.clear();
                    });
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        _scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    }
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
              color: ColorManager.thucolor,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.textfeildbordercolor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.textfeildbordercolor),
            ),
          ),
        ),
      );
}
