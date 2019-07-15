import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatClassifyData.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatResponseData.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'package:wan_android_flutter/network/NetClient.dart';
import 'package:wan_android_flutter/view/WeChatTabWidget.dart';

class WeChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WeChatPageState();
  }
}

class _WeChatPageState extends State<WeChatPage>
    with SingleTickerProviderStateMixin {
  List<WeChatClassifyData> mWeChatClassifyDataList;

  int mTabLength = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mWeChatClassifyDataList = new List();

    queryWeChatClassifyData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (mWeChatClassifyDataList == null ||
        mWeChatClassifyDataList.length == 0) {
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
              title: new Text("公众号"),
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
    if (mWeChatClassifyDataList != null && mWeChatClassifyDataList.length > 0) {
      for (WeChatClassifyData classifyData in mWeChatClassifyDataList) {
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
    List<WeChatTabWidget> contents = new List();
    if (mWeChatClassifyDataList != null && mWeChatClassifyDataList.length > 0) {
      for (WeChatClassifyData classifyData in mWeChatClassifyDataList) {
        contents.add(new WeChatTabWidget(classifyData.id));
      }
    }
    return contents;
  }

  void queryWeChatClassifyData() {
    print("queryProjectClassifyData ---> ");
    NetClient.getInstance()
        .get("https://wanandroid.com/wxarticle/chapters/json", (response) {
      if (response != null && response.data != null) {
        print("queryProjectClassifyData ： " + response.data.toString());
        WeChatResponseData responseData =
            WeChatResponseData.fromJson(response.data);
        if (responseData != null) {
          if (AppConstants.SUC_CODE == responseData.errorCode) {
            setState(() {
              mWeChatClassifyDataList.clear();
              mWeChatClassifyDataList.addAll(responseData.data);
              mTabLength = mWeChatClassifyDataList.length;
              _tabController =
                  new TabController(length: mTabLength, vsync: this);
            });
          } else {
            print("请求失败 : " + responseData.errorMsg);
          }
        }
      }
    });
  }
}
