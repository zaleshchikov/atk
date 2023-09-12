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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  twoButtonScreen(),
    ));
  }
}







