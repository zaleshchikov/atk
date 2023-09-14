
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atk/news/rss.dart';
import 'video/video_screen.dart';



class twoButtonScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Первый туристический',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge
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
                fillColor: theme.colorScheme.tertiary,
                child:
                Container(
                    height: 120,
                    child: Center(
                        child: Text(
                          "Эфир",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge
                        ))),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),

              Divider(
                thickness: 10,
                color: theme.colorScheme.tertiary,
              ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => rssLent()),
            );

          },
          elevation: 2.0,
          fillColor: theme.colorScheme.tertiary,
          child:
          Container(
            height: 120,
            child: Center(
                child: Text(
            "Новости",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge
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
