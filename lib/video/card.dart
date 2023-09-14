import 'package:flutter/material.dart';

class cardList extends StatelessWidget {
  String title;
  String discription;
  String image;
  cardList({ required this.title, required this.discription, required this.image});


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Card(
        color: theme.colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side:  BorderSide(
          color: theme.colorScheme.outline,
          width: 2,),
      ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // Define the child widget of the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add padding around the row widget
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Add an image widget to display an image
                  Image.network(
                    "$image",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  // Add some spacing between the image and the text
                  Container(width: 20),
                  // Add an expanded widget to take up the remaining horizontal space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Add some spacing between the top of the card and the title
                        Container(height: 5),
                        // Add a title widget
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium
                        ),
                        // Add some spacing between the title and the subtitle
                        // Add a subtitle widget

                        // Add some spacing between the subtitle and the text
                        Container(height: 10),
                        // Add a text widget to display some text
                        /*Text(
                          discription,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}
