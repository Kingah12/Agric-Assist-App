import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
// import 'package:zegof ';

class CallInvitationPage extends StatefulWidget {
  const CallInvitationPage(
      {Key? key, required this.child, required this.userName, required this.id})
      : super(key: key);

  final Widget child;
  final String userName;
  final String id;

  @override
  State<CallInvitationPage> createState() => _CallInvitationPageState();
}

class _CallInvitationPageState extends State<CallInvitationPage> {
  /// on App's user login
  void onUserLogin() {
    /// 2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    // ZegoUIKitPrebuiltCallWithInvitation(
    //   notifyWhenAppRunningInBackgroundOrQuit: true,
    //   appID: 712545703,
    //   appSign:
    //       "c3c2e49f6352bccd98cb45d7460fcba7ccc50f57a336ed0a7ef70eac8177f023",
    //   userID: widget.userName,
    //   userName: widget.userName,
    //   // child: widget.child,
    //   plugins: [ZegoUIKitSignalingPlugin()], child: widget.child,
    // );

    ZegoUIKitPrebuiltCallInvitationService().init(
        notifyWhenAppRunningInBackgroundOrQuit: true,
        appID: 712545703,
        appSign:
            "c3c2e49f6352bccd98cb45d7460fcba7ccc50f57a336ed0a7ef70eac8177f023",
        userID: widget.id,
        userName: widget.userName,
        isIOSSandboxEnvironment: false,
        // child: widget.child,
        plugins: [ZegoUIKitSignalingPlugin()]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
