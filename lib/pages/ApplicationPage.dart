import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/BlogPage.dart';
import 'package:wan_android_flutter/pages/MinePage.dart';
import 'package:wan_android_flutter/pages/ProjectPage.dart';
import 'package:wan_android_flutter/pages/WeChatPage.dart';

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
    return new Scaffold(
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
}
