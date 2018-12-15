import 'package:flutter/material.dart';
import 'package:flutter_punch/models/CategoryListModel.dart';
import 'package:flutter_punch/models/CategoryModel.dart';
import 'package:flutter_punch/models/ForumsModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryTitle;
  final List<ForumsModel> forums;

  CategoryWidget({@required this.categoryTitle, @required this.forums});

  //  Row(children: forums.map((forum) => Text(forum.title)).toList()),

  Widget isSVGOrImage(String forumId, String icon) {
    Widget child;

    if (forumId == "gmodgd" || forumId == "rust") {
      return Image(
        image: NetworkImage(icon),
        width: 30.0,
      );
    } else {
      return SvgPicture.network(
        icon,
        width: 30.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                color: Colors.blueGrey[50],
                border: new Border.all(color: Colors.blueGrey[100])),
            padding: EdgeInsets.all(16.0),
            child: Text(categoryTitle),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: forums
                  .map((forum) => Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 16.0),
                              child: isSVGOrImage(forum.id, forum.icon)),
                          Text(forum.title)
                        ],
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
