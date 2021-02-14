import 'package:flutter/foundation.dart';

class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedDate;
  NewsModel(
      {this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.imageUrl,
      this.publishedDate});
}
