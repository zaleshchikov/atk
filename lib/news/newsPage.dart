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
    ThemeData theme = Theme.of(context);
    return  Scaffold(
          backgroundColor: theme.colorScheme.background,
          appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
        ),

        backgroundColor: theme.colorScheme.primary,
        automaticallyImplyLeading: true,
        title:
          Text(
            title,
            // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge

        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
        child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          textAlign: TextAlign.left,
                          // textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge

                        )),
          ],
        ),
                )),
      )
    );
  }
}
