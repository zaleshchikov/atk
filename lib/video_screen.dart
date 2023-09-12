import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flisk.dart';
import 'package:flutter/services.dart';
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

//This will help to hide the status bar and bottom bar of Mobile
//also helps you to set preferred device orientations like landscape

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

//This will help you to push fullscreen view of video player on top of current page

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
        /*.then(
          (value) {

//This will help you to set previous Device orientations of screen so App will continue for portrait mode

        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations(
          [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
        );
      },
    );*/
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
    //controller.dispose();
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
                            // Wrap the play or pause in a call to `setState`. This ensures the
                            // correct icon is shown.
                            setState(() {
                              // If the video is playing, pause it.
                              if (controller.value.isPlaying) {
                                controller.pause();
                              } else {
                                // If the video is paused, play it.
                                controller.play();
                              }
                            });
                          },
                          // Display the correct icon depending on the state of the player.
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
                          // Display the correct icon depending on the state of the player.
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
