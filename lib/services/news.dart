// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../model/article_model.dart';
//
// class News{
//   List<ArticleModel> news=[];
//
//
//   Future<void> getNews()async{
//     String url="https://newsapi.org/v2/everything?q=tesla&from=2024-01-11&sortBy=publishedAt&apiKey=0eb9e3cd1cb848499040a7adbb828a79";
//     var response= await http.get(Uri.parse(url));
//
//     var jsonData= jsonDecode(response.body);
//
//     if(jsonData['status']=='ok'){
//       jsonData["articles"].forEach((element){
//         if(element["urlToImage"]!=null && element['description']!=null){
//           ArticleModel articleModel= ArticleModel(
//             title: element["title"],
//             description: element["description"],
//             url: element["url"],
//             urlToImage: element["urlToImage"],
//             content: element["content"],
//             author: element["author"],
//           );
//           news.add(articleModel);
//         }
//       });
//     }
//
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class News{
  List<ArticleModel> news=[];


  Future<void> getNews()async{
    String url=
        "https://newsapi.org/v2/everything?q=tesla&from=2024-01-15&sortBy=publishedAt&apiKey=0eb9e3cd1cb848499040a7adbb828a79";
    var response= await http.get(Uri.parse(url));

    var jsonData= jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null){
          ArticleModel articleModel= ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          news.add(articleModel);
        }
      });
    }

  }
}