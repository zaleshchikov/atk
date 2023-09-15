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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    "$image",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Container(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        // Add a title widget
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium
                        ),

                        Container(height: 10),

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
