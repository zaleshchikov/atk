

import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'model.dart';

class parsedData{

  static getContent(items){
    String content = "";
    var index = items[0].length == 0? 2 : 1;

    for (String s in items.sublist(index, items.length-1)){
      content += s.replaceAll('<', '').replaceAll('>', '').replaceAll('p', '').replaceAll('br', '').replaceAll('/', '').replaceAll('\\', '').replaceAll('\n', '').replaceAll('&nbs;', '');
      content += '\n\n';
    }
    return content;
  }

  static getImage(item){
    var listOfFirstNews = item.split('<p>');
    var index = listOfFirstNews[0].length == 0? 1 : 0;
    var start =
        listOfFirstNews[index].indexOf("src=")+5;
    var finish = listOfFirstNews[index].length - start;
    listOfFirstNews[index] = listOfFirstNews[index].substring(start, finish);
    final image = (listOfFirstNews[index].substring(0, listOfFirstNews[index].indexOf("\"")));
    return image;
  }


  static Model getPasedData(item) {


    var firstNews = item.content!.value;
    var listOfFirstNews = firstNews.split('<p>');
    listOfFirstNews[0] = listOfFirstNews[0].substring(listOfFirstNews[0].indexOf('src=')+5, listOfFirstNews[0].length - listOfFirstNews[0].indexOf('src=')+5);
    var image = (listOfFirstNews[0].substring(0, listOfFirstNews[0].indexOf("\"")));

    var title = item.title;
    var description = item.description!.split('</p>')[0].replaceAll('<', '').replaceAll('>', '').replaceAll('p', '');
    String content = "";

    for (String s in listOfFirstNews.sublist(1, listOfFirstNews.length-1)){
      content += s.replaceAll('<', '').replaceAll('>', '').replaceAll('p', '').replaceAll('br', '').replaceAll('/', '').replaceAll('\\', '').replaceAll('\n', '').replaceAll('&nbs;', '');
      content += '\n\n';
    }

    //print(description);
    //print(content);

    return Model(title: 'title', description: 'description', image: 'image', content: 'content');
  }


}
