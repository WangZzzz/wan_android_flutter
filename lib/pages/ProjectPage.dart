import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/bean/project/ProjectClassifyData.dart';
import 'package:wan_android_flutter/bean/project/ProjectResponseData.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'package:wan_android_flutter/network/NetClient.dart';
import 'package:wan_android_flutter/view/ProjectTabWidget.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ProjectPageState();
  }
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  List<ProjectClassifyData> mProjectClassifyDataList;

  int mTabLength = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mProjectClassifyDataList = new List();

    queryProjectClassifyData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (mProjectClassifyDataList == null ||
        mProjectClassifyDataList.length == 0) {
      return Container(
        child: CupertinoActivityIndicator(),
        margin: EdgeInsets.only(top: 20),
      );
    } else {
      // TODO: implement build
      return new DefaultTabController(
          length: mTabLength,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text("项目"),
              centerTitle: true,
              bottom: new TabBar(
                tabs: genTabs(),
                isScrollable: true,
                controller: _tabController,
              ),
            ),
            body: new TabBarView(
              controller: _tabController,
              children: genTabContents(),
            ),
          ));
    }
  }

  List<Widget> genTabs() {
    List<Widget> tabs = new List();
    if (mProjectClassifyDataList != null &&
        mProjectClassifyDataList.length > 0) {
      for (ProjectClassifyData classifyData in mProjectClassifyDataList) {
//        print("tab title : " + classifyData.name);
        tabs.add(new Tab(
          text: classifyData.name,
        ));
      }
    }
    print("tabs length : " + tabs.length.toString());
    return tabs;
  }

  List<Widget> genTabContents() {
    List<ProjectTabWidget> contents = new List();
    if (mProjectClassifyDataList != null &&
        mProjectClassifyDataList.length > 0) {
      for (ProjectClassifyData classifyData in mProjectClassifyDataList) {
        contents.add(new ProjectTabWidget(classifyData.id));
      }
    }
    return contents;
  }

  void queryProjectClassifyData() {
    print("queryProjectClassifyData ---> ");
    NetClient.getInstance().get("https://www.wanandroid.com/project/tree/json",
        (response) {
      if (response != null && response.data != null) {
        print("queryProjectClassifyData ： " + response.data.toString());
        ProjectResponseData projectResponseData =
            ProjectResponseData.fromJson(response.data);
        if (projectResponseData != null) {
          if (AppConstants.SUC_CODE == projectResponseData.errorCode) {
            setState(() {
              mProjectClassifyDataList.clear();
              mProjectClassifyDataList.addAll(projectResponseData.data);
              mTabLength = mProjectClassifyDataList.length;
              _tabController =
                  new TabController(length: mTabLength, vsync: this);
            });
          } else {
            print("请求失败 : " + projectResponseData.errorMsg);
          }
        }
      }
    });
  }
}
