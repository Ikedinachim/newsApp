import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsApp/screens/articles.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String actualUrl;
  NewsTile(this.imageUrl, this.title, this.description, this.actualUrl);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => WebViewNews(actualUrl)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(title, style: TextStyle(color: Colors.black, fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text(description, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
