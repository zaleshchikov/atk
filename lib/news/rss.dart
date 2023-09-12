import 'dart:io';

import 'package:atk/model/parse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:webfeed/webfeed.dart';
import 'package:atk/model//model.dart';
import '../../video/card.dart';
import 'newsPage.dart';

class NewsModel {
  final String title;
  final String description;
  final String image;

  NewsModel({required this.title, required this.description, required this.image});
}

String capitalize(String str){
  return "${str[0].toUpperCase()}${str.substring(1)}";
}


class rssLent extends StatelessWidget {
  static String rssUrl = 'https://1tourtv.online/category/news/feed/';
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
          title: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Первый туристический',
              // textAlign: TextAlign.center,
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
        body: Container(

          child: FutureBuilder(
            future: fetchNews(),
            builder: (context, snap) {
              if (snap.hasData) {
                final _news = snap.data;
                return ListView.separated(
                  itemBuilder: (context, i) {
                    final Model _item = _news[i];
                    return InkWell(
                        onTap: (){
                          print('tap)');
                          Navigator.push(
                              context,
                          MaterialPageRoute(builder: (context) =>  page(title: _item.title, image: _item.image, content: _item.content))
                          );
                        },
                        child: cardList(title: _item.title, discription: capitalize(_item.description.replaceAll('<', '').replaceAll('>', '').replaceAll('p', '').replaceAll('/', '')), image: _item.image)
                    );},
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: _news.length,
                );
              } else if (snap.hasError) {
                return Center(
                  child: Text(snap.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
  Future fetchNews() async {
    final _response = await http.get(Uri.parse(rssUrl));

    if (_response.statusCode == 200) {
      var _decoded = RssFeed.parse(_response.body);

      return _decoded.items!
          .map((item) => Model(
          title: item.title ?? 'Exeption',
          description: item.description!.split('</p>')[0].replaceAll('<', '').replaceAll('>', '').replaceAll('p', '') ?? '',
          image:  parsedData.getImage(item.content!.value),
          content: parsedData.getContent(item.content!.value!.split('<p>'))
      ))
          .toList();

    } else {
      throw HttpException('Failed to fetch the data');
    }
  }
}
