import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import 'dart:convert';

class News extends ChangeNotifier {
  String category;
  void setCategory(String categoryName) {
    category = categoryName;
    notifyListeners();
  }

  Future<List<NewsModel>> getNews() async {
    List<NewsModel> news = [];
    String url;
    if (category == null) {
      url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=50ddaf957258495da71f0dc11baa0ef6';
    } else {
      url =
          'https://newsapi.org/v2/top-headlines?country=us&category=${category.toLowerCase()}&apiKey=50ddaf957258495da71f0dc11baa0ef6';
    }
    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body) as Map<String, Object>;
      print(jsonData['status']);
      if (jsonData['status'] == 'ok') {
        (jsonData['articles'] as List<dynamic>).forEach((element) {
          if (element['description'] != null || element['urlToImage'] != null) {
            var newsmodel = NewsModel(
                description: element['description'],
                imageUrl: element['urlToImage'],
                title: element['title'],
                url: element['url'],
                author: element['author'],
                publishedDate: element['publishedAt']);
            news.add(newsmodel);
          }
        });
        notifyListeners();
      }
    } catch (error) {
      print(error);
      throw (error);
    }
    return news;
  }
}
