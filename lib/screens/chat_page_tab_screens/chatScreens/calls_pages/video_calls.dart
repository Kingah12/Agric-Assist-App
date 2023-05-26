// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// class VideoCallsPage extends StatefulWidget {
//   const VideoCallsPage({Key? key}) : super(key: key);
//
//   @override
//   State<VideoCallsPage> createState() => _VideoCallsPageState();
// }
//
// class _VideoCallsPageState extends State<VideoCallsPage> {
//   final AgoraClient _agoraClient = AgoraClient(
//       agoraConnectionData: AgoraConnectionData(
//     appId: '0989889db7914c0ab81ecc412755d85e',
//     channelName: 'test_agAssist',
//     tempToken:
//         '007eJxTYJj0lPfhJK9QDuat4jklexbX/rkQf6L5/9zozDU5rQv/CNsqMBhYWlhaWFimJJlbGpokGyQmWRimJiebGBqZm5qmWJimWgeLpDQEMjLcncnOwsgAgSA+L0NJanFJfGK6Y3FxZnEJAwMAlZMi2g==',
//   ));
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _initAgora();
//   }
//
//   _initAgora() async {
//     await _agoraClient.initialize();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Video Call'),
//         ),
//         body: SafeArea(
//           child: Stack(
//             children: [
//               AgoraVideoViewer(client: _agoraClient),
//               AgoraVideoButtons(client: _agoraClient)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class videoCallPage extends StatefulWidget {
  final String callID;
  final String userId;
  final String userName;
  const videoCallPage(
      {Key? key,
      required this.callID,
      required this.userName,
      required this.userId})
      : super(key: key);

  @override
  State<videoCallPage> createState() => _videoCallPageState();
}

class _videoCallPageState extends State<videoCallPage> {
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
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
