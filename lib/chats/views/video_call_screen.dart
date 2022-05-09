import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "3b8617f544034c74a3593665c87ea93b",
        channelName: "fluttering",
        tempToken:
            "0063b8617f544034c74a3593665c87ea93bIABOo4b00QMXJqr1d/nJ6x3RP/gu3459yhbACKDBGHZgcr2YShYAAAAAEACgcVr/Zb16YgEAAQBlvXpi"),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Video Call"),
         
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: client,
                enabledButtons: [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
