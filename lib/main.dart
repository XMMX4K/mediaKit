import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Necessary initialization for package:media_kit.
  MediaKit.ensureInitialized();
  runApp(
    const MaterialApp(
      home: MyScreen(),
    ),
  );
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});
  @override
  State<MyScreen> createState() => MyScreenState();
}

class MyScreenState extends State<MyScreen> {
  final Player player = Player();

  @override
  void initState() {
    super.initState();
    // Play a [Media] or [Playlist].
    player.open(Media(
        'https://media231006-prod.s3.ap-southeast-1.amazonaws.com/protected/ap-southeast-1:6adb5f6f-21fb-4d88-88c7-0b0fbb93c1b8/694371f4-23ac-4609-8e97-07237f8dc7bb.mp4'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: Video(
          controller: VideoController(player),
        ),
      ),
    );
  }
}
