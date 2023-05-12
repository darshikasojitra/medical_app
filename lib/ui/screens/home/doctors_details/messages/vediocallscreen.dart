import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:agora_uikit/agora_uikit.dart';

class vediocallScreen extends StatefulWidget {
  const vediocallScreen({super.key});

  @override
  State<vediocallScreen> createState() => _vediocallScreenState();
}

class _vediocallScreenState extends State<vediocallScreen> {
  final AgoraClient _client = AgoraClient(
      agoraConnectionData:
          AgoraConnectionData(appId: '', channelName: '', tempRtmToken: ''));
          @override
  void initState() {
    super.initState();
    _initAgora();
  }
  Future<void> _initAgora() async{
    await _client.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('vedio call'),),
        body: SafeArea(child: Stack(children: [
          AgoraVideoViewer(client: _client,layoutType: Layout.floating,showNumberOfUsers: true,),
          AgoraVideoButtons(client: _client,enabledButtons: const[BuiltInButtons.callEnd,BuiltInButtons.toggleCamera,BuiltInButtons.toggleMic],)
        ],)),
      ),
    );
  }
}
