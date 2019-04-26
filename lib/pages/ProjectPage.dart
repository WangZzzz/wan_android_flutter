import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ProjectPageState();
  }
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  int mTabLength = 3;

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: mTabLength, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: mTabLength,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text("项目"),
            centerTitle: true,
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(
                  text: "完整项目",
                ),
                new Tab(
                  text: "Flutter相关",
                ),
                new Tab(
                  text: "开源",
                ),
              ],
              controller: _tabController,
            ),
          ),
          body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new Center(child: new Text('自行车')),
              new Center(child: new Text('船')),
              new Center(child: new Text('巴士')),
            ],
          ),
        ));
  }
}
