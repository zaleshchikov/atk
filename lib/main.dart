import 'package:atk/news/rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_screen.dart';
import 'model/parse.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return Shortcuts(
        shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child:
      MaterialApp(
        theme: ThemeData(
          useMaterial3: true,

          // Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            primary: Color(0xffFEF0CA),
            seedColor: Color(0xffFEF0CA),
            secondary: Color(0xffA4935F),
            tertiary: Color(0xffE6C94F),
            outline: Color(0xff403100),
          ),

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            // ···
            titleLarge: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w800
            ),
            bodyMedium: GoogleFonts.ubuntu(
                fontSize: 18,
                //fontWeight: FontWeight.w700,
                color: Color(0xff403100)
            ),
            displaySmall: GoogleFonts.pacifico(),
          ),
        ),

        title: 'Flutter Demo',

      home:  rssLent(),
    ));
  }
}







