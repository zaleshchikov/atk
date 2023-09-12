import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
class VideoPlayerTV extends StatefulWidget {
  const VideoPlayerTV({Key? key}) : super(key: key);

  @override
  State<VideoPlayerTV> createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerTV> {
  late VideoPlayerController controller;
  String videoUrl =
      'https://stream.ms-rostov.ru/tourist1/1/playlist.m3u8';

  void pushFullScreenVideo() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );

    Navigator.of(context)
        .push(
      PageRouteBuilder(
        opaque: true,
        settings: RouteSettings(),
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              body: Dismissible(
              key: const Key('key'),
          //direction: DismissDirection.vertical,
          onDismissed: (_) => Navigator.of(context).pop(),
          child: OrientationBuilder(
          builder: (context, orientation) {
          var isPortrait = orientation == Orientation.portrait;
          return Center(
          child: Stack(
          //This will help to expand video in Horizontal mode till last pixel of screen
          fit: isPortrait ? StackFit.loose : StackFit.expand,
          children: [
          AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
          ),
          ],
          ),
          );
          },
          )));
        },
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(videoUrl);
    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() { }));
    controller.play();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return
      MaterialApp(
          home: Scaffold(
              backgroundColor: Color(0xFFFFE286),
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {
                    controller.dispose();
                    Navigator.pop(context, false);},
                ),

                backgroundColor: Color(0xFFEFD639),
                automaticallyImplyLeading: false,
                title: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Text(
                    'Первый туристический',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 2,
              ),
              body:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                        BoxShadow(
                        blurRadius: 25.0,
                      ),
                  ],
                ),
                      width: MediaQuery.of(context).size.width*0.6,
                      height: MediaQuery.of(context).size.width*0.4,
                      // height: MediaQuery.of(context).size.width*0.55,
                      child: InkWell(
                          onTap: () {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                          },
                          child: AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),

                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.amberAccent,
                          onPressed: () {
                            setState(() {
                              if (controller.value.isPlaying) {
                                controller.pause();
                              } else {
                                controller.play();
                              }
                            });
                          },
                          child: Icon(
                            controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.amberAccent,
                          onPressed: () {
                            pushFullScreenVideo();
                          },
                          child: Icon(
                             Icons.fullscreen,
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              )));
  }
}
