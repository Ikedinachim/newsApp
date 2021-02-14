import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsApp/http/new_data.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatefulWidget {
  final String imageUrl;
  final String categoryName;

  CategoryItem(this.imageUrl, this.categoryName);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  Color textColor = Colors.white;
  //bool _colorFlag = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<News>(context, listen: false)
            .setCategory(widget.categoryName);
        // setState(() {
        //   textColor = Colors.black;
        // });
      },
      child: Container(
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 8.0, top: 5),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              height: 60,
              width: 120,
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.black26,
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  widget.categoryName,
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
