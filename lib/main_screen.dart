
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atk/news/rss.dart';
import 'video/video_screen.dart';



class twoButtonScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFE286),
        appBar: AppBar(
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  VideoPlayerTV()),
                  );

                },
                elevation: 2.0,
                fillColor: Color(0xFFAE7009),
                child:
                Container(
                    height: 120,
                    child: Center(
                        child: Text(
                          "Эфир",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700
                          ),
                        ))),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),

              Divider(
                thickness: 10,
                color: Color(0xFFAE7009),
              ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => rssLent()),
            );

          },
          elevation: 2.0,
          fillColor: Color(0xFFAE7009),
          child:
          Container(
            height: 120,
            child: Center(
                child: Text(
            "Новости",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700
            ),
          ))),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        )
]
    ),
      ),
    );
  }
}
