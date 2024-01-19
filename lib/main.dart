import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/home_page.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> main() async {
  await OnAudioRoom().initRoom();
  runApp(MaterialApp(

    home: splash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
  ));
}

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    permission();

    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return home_page();
          },
        ));
      },
    );
  }

  permission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> status = await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container( child: Center(
        child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const Scaffold(

        );
      }));
    },

    child: AnimatedTextKit(

        animatedTexts: [
        ScaleAnimatedText('MUSIC',),
          ScaleAnimatedText('PLAYER'),
          ScaleAnimatedText('APP'),

          ],
          onTap: () {
      print("MUSIC PLAYER");
      },
        ),
    ),
    )
      ));
  }
}
