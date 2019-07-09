import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan_android_flutter/pages/BlogPage.dart';
import 'package:wan_android_flutter/pages/MinePage.dart';
import 'package:wan_android_flutter/pages/ProjectPage.dart';
import 'package:wan_android_flutter/pages/WeChatPage.dart';

/**
 * flutter TabbarView PageView 切换保存状态
 * PageView 的children需要是一个 StatefulWidget
    要实现 AutomaticKeepAliveClientMixin 不是 PageView 所在的Widget, 而是 PageView 的children 所在的Widget
 */

class ApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ApplicationPageState();
  }
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  static final TAB_TITLES = {"博文", "项目", "公众号", "我"};

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
        child: new Scaffold(
          body: new PageView.builder(
            onPageChanged: _pageChange,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return new BlogPage();
                case 1:
                  return new ProjectPage();
                case 2:
                  return new WeChatPage();
                case 3:
                  return new MinePage();
              }
            },
            itemCount: 4,
          ),
          bottomNavigationBar: new BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.aspect_ratio,
                  color: Colors.blue,
                ),
                title: new Text(
                  "博文",
                  style: new TextStyle(color: Colors.blue),
                ),
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.laptop_mac,
                  color: Colors.blue,
                ),
                title: new Text(
                  "项目",
                  style: new TextStyle(color: Colors.blue),
                ),
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.message,
                  color: Colors.blue,
                ),
                title: new Text(
                  "公众号",
                  style: new TextStyle(color: Colors.blue),
                ),
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.android,
                  color: Colors.blue,
                ),
                title: new Text(
                  "我",
                  style: new TextStyle(color: Colors.blue),
                ),
              ),
            ],
            currentIndex: _currentPageIndex,
            onTap: onTap,
          ),
        ),
        onWillPop: _requestPop);
  }

  Future<bool> _requestPop() {
    if (_currentPageIndex != 0) {
      setState(() {
        _currentPageIndex = 0;
      });
      onTap(_currentPageIndex);
    } else {
      _showDialog();
    }
    return new Future.value(false);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
              title: new Text("提示"),
              content: new Text('您确定要退出系统吗？'),
              actions: [
                new FlatButton(
                    onPressed: () async {
                      Navigator.pop(context, true);
                      await exitApp();
                    },
                    child: new Text('确定')),
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: new Text('取消'))
              ]),
    );
  }

  void onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  /**
   * 退出应用
   */
  static Future<void> exitApp() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
