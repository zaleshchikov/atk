import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class page extends StatelessWidget {

  String title;
  String image;
  String content;
  page({
    required this.title,
    required this.image,
    required this.content
});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFFFE286),
          appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
        ),

        backgroundColor: Color(0xFFEFD639),
        automaticallyImplyLeading: true,
        title:
          Text(
            title,
            // textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),

        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
        child: SingleChildScrollView(
                child: Column(
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Image.network(
                          "$image",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                      ),
                      InkWell(
                        onTap: (){

                        },
                      child:Text(
                        content,
                        textAlign: TextAlign.center,
                        // textAlign: TextAlign.center,
                        style: TextStyle(

                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: Colors.grey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),

                      )),
          ],
        )),
      ))
    );
  }
}
