import 'package:flutter/material.dart';
import 'package:wan_android_flutter/view/BannerWidget.dart';
import 'package:wan_android_flutter/view/BlogListWidget.dart';

class BlogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BlogPageState();
  }
}

class _BlogPageState extends State<BlogPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("博文"),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new BannerWidget(),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new BlogListWidget(),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
