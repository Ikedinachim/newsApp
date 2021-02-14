import 'package:flutter/material.dart';
import 'package:newsApp/http/new_data.dart';
import 'package:newsApp/models/news_model.dart';
import 'package:newsApp/widgets/category_item.dart';
import 'package:newsApp/widgets/news_tile.dart';
import 'package:provider/provider.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<NewsModel>> news;
  bool _isLoading;
  List<NewsModel> actualNews = [];

  final Data data = Data();
  @override
  void initState() {
    _isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<News>(context).getNews().then((value) {
      actualNews = value;
      setState(() {
        _isLoading = false;
      });
    });
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(6.0),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                      itemCount: data.categories.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return CategoryItem(data.categories[index].imageUrl,
                            data.categories[index].categoryName);
                      }),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: const EdgeInsets.all(6.0),
                  child: ListView.builder(
                      itemCount: actualNews.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return NewsTile(
                            actualNews[index].imageUrl,
                            actualNews[index].title,
                            actualNews[index].description,
                            actualNews[index].url);
                      }),
                )
              ],
            ),
    );
  }
}
