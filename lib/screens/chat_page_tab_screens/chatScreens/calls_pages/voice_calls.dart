import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VoiceCallPage extends StatefulWidget {
  final String callID;
  final String userId;
  final String userName;
  const VoiceCallPage(
      {Key? key,
      required this.callID,
      required this.userName,
      required this.userId})
      : super(key: key);

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  int appId = 1502292490;
  String appSignIn =
      '815e51fd40a8a3390b7e78b7d312239a010c61b9d09d77ae0f0e6212d6dbc14d';
  String serverSecret = '';

  @override
  Widget build(BuildContext context) {
    // return ZegoUIKitPrebuiltCallWithInvitation(
    //   plugins: [ZegoUIKitSignalingPlugin()],
    //   appID:
    //       appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
    //   appSign:
    //       appSignIn, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
    //   userID: widget.userId,
    //   // serverSecret: serverSecret,
    //   userName: widget.userName,
    //   // callID: widget.callID,
    //   // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
    //   // config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
    //   //   ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    //   child: Text('muyiwa otilo'),
    // );
    return ZegoUIKitPrebuiltCall(
      appID:
          appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          appSignIn, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: widget.userId,
      userName: widget.userName,
      callID: widget.callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
