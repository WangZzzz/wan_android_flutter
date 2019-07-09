import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/bean/blog/BlogData.dart';
import 'package:wan_android_flutter/bean/blog/BlogDetailData.dart';
import 'package:wan_android_flutter/bean/blog/BlogResponseData.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'package:wan_android_flutter/network/NetClient.dart';

import 'dart:ui' as ui;

import 'package:wan_android_flutter/pages/WebViewPage.dart';

class BlogListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BlogListWidgetState();
  }
}

class _BlogListWidgetState extends State<BlogListWidget> {
  List<BlogDetailData> blogDetailDataList = new List<BlogDetailData>();

  //当前页
  int mCurrentPage;
  int mOffset = 0;

  int mTotalPage = 1;

  /**
   * 是否正在加载中
   */
  bool mIsLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /**
     * 加载更多数据使用
     */
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (mIsLoading) {
          return;
        }
        print("已经滑动到底部，加载更多数据!");
        mOffset = mCurrentPage;
        queryBlogData();
      }
    });
    queryBlogData();
  }

  void queryBlogData() {
    if (mIsLoading) {
      return;
    }
    mIsLoading = true;
    String url = "https://www.wanandroid.com/article/list/" +
        mOffset.toString() +
        "/json";
    print("url--->" + url);
    NetClient.getInstance().get(url, (response) {
      mIsLoading = false;
      print("queryBlogData : " + response.data.toString());
      BlogResponseData blogResponseData =
          BlogResponseData.fromJson(response.data);
      if (blogResponseData.errorCode == AppConstants.SUC_CODE) {
        setState(() {
          try {
            mTotalPage = blogResponseData.data.total;
            mCurrentPage = blogResponseData.data.curPage;
            BlogData blogData = blogResponseData.data;
            if (blogData != null &&
                blogData.datas != null &&
                blogData.datas.length > 0) {
              this.blogDetailDataList.addAll(blogData.datas);
            }
          } catch (e) {
            print(e.toString());
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (blogDetailDataList == null || blogDetailDataList.length == 0) {
      return Container(
        child: CupertinoActivityIndicator(),
        margin: EdgeInsets.only(top: 20),
      );
    } else {
      double screenHeight = MediaQueryData.fromWindow(ui.window).size.height;
      double screenWidth = MediaQueryData.fromWindow(ui.window).size.width;
      //banner的高度为 screenWidth * 500 / 900
      return new Container(
        height: screenHeight - screenWidth * 500 / 900 - 150,
        child: new RefreshIndicator(
          displacement: 10,
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount:
                  blogDetailDataList == null ? 0 : blogDetailDataList.length,
              itemBuilder: (BuildContext context, int position) {
                return BlogItemWidget(blogDetailDataList[position]);
              }),
          onRefresh: _onRefresh,
        ),
      );
    }
  }

  /**
   * 下拉更新最新的数据
   */
  Future<Null> _onRefresh() async {
    if (mIsLoading) {
      return;
    }
    mOffset = 0;
    blogDetailDataList.clear();
    queryBlogData();
  }
}

class BlogItemWidget extends StatelessWidget {
  BlogDetailData blogDetailData;

  BlogItemWidget(this.blogDetailData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      child: new Container(
        height: 100,
        child: new Card(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildItemLeftColumns(blogDetailData),
          ),
        ),
      ),
      onTap: () {
        print("点击了：" + blogDetailData.link);
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) {
            return new WebViewPage(
              blogDetailData.link,
              blogDetailData.title,
            );
            //link,
            // title为需要传递的参数
          },
        ));
      },
    );
  }
}

List<Widget> _buildItemLeftColumns(BlogDetailData item) {
  List<Widget> list = List();
  list.add(new Container(
    child: Text(
      item.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w500),
      textAlign: TextAlign.left,
    ),
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
  ));
  if (item.desc.length > item.title.length) {
    list.add(Container(
      child: Text(
        item.desc,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: 13.0),
      ),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    ));
  }
  list.add(
   Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.access_time,
            size: 13.0,
            color: Colors.blueAccent,
          ),
          Text(" ${item.niceDate} @${item.author}",
              style: TextStyle(color: Colors.grey, fontSize: 13.0))
        ],
    ),
  ));
//  var tags = _buildTagsAndDate(item);
//  if (tags.length > 0) {
//    list.add(Row(
//      textBaseline: TextBaseline.ideographic,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: tags,
//    ));
//  }
  return list;
}
