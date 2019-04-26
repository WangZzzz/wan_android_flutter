import 'package:flutter/material.dart';
import 'package:wan_android_flutter/view/BannerWidget.dart';
import 'package:wan_android_flutter/view/BlogListWidget.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("博文"),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new BannerWidget(),
            new BlogListWidget(),
          ],
        ));
  }
}
