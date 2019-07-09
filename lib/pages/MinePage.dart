import 'package:flutter/material.dart';
import 'package:wan_android_flutter/view/mine/PreLoginWidget.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFE7E7E7),
      appBar: new AppBar(
        title: new Text("我"),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new PreLoginWidget(),
        ],
      ),
    );
  }
}
