import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class VedioCallScreen extends StatefulWidget {
  const VedioCallScreen({super.key});

  @override
  State<VedioCallScreen> createState() => _VedioCallScreenState();
}

class _VedioCallScreenState extends State<VedioCallScreen> {
  late RtcEngine _engine;
  int? _remoteUid;
  bool _mute = true;
  bool _localUserJoined = false;
  Future<void> _messageScreen() async {
    Navigator.pop(context);
  }

  Future<void> _onoffmic() async {
    setState(() {
      _mute = !_mute;
    });
  }

  final _token =
      '007eJxTYAiKWlEaV68xh1NM+/W5u3vc5jnrX0zz8m2cYZet4rIl8oICg5FlWrJJYrKRQVqqoYmJaZKlgUVqWqKBiYmBQapJkpHlZf38lIZARgbzRgNGRgZGBhYgBvGZwCQzmGSBkiWpxSUMDADgSh/S';

  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: '29fc4ac20fe1445b908efa04400e4b29',
      channelName: 'test',
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    // _client.initialize();
    await [Permission.microphone, Permission.camera].request();
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: '29fc4ac20fe1445b908efa04400e4b29',
      channelProfile: ChannelProfileType.channelProfileCommunication1v1,
    ));
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: _token,
      channelId: 'test',
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: true,
        //   title: const Text('vedio call'),
        // ),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: _remoteVideo(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Center(
                    child: _localUserJoined
                        ? AgoraVideoView(
                            controller: VideoViewController(
                              rtcEngine: _engine,
                              canvas: const VideoCanvas(uid: 0),
                            ),
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
              ),
              //  AgoraVideoButtons(
              //     client: _client,
              //     enabledButtons: const [
              //       BuiltInButtons.toggleCamera,
              //       BuiltInButtons.switchCamera,
              //       BuiltInButtons.callEnd,
              //       BuiltInButtons.toggleMic,
              //     ],
              //   ),

              _buttons()
            ],
          ),
        ),
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(
              channelId: '29fc4ac20fe1445b908efa04400e4b29'),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _buttons() => Padding(
        padding: EdgeInsets.only(top: 600.h, left: 0, right: 0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _onoffmic(),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: !_mute ? Colors.blueAccent : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: _mute
                    ? const Icon(Icons.mic)
                    : const Icon(
                        Icons.mic_off,
                        color: Colors.white,
                      ),
              ),
            ),
            buildSizedBoxSpacer(width: 20.w),
            GestureDetector(
              onTap: () => _messageScreen(),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.call_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            buildSizedBoxSpacer(width: 20.w),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: GestureDetector(
                  child: const Icon(Icons.cameraswitch_outlined)),
            )
          ],
        ),
      );
}
