import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatTabDetailData.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatTabResponseData.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'package:wan_android_flutter/network/NetClient.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android_flutter/pages/WebViewPage.dart';

class WeChatTabWidget extends StatefulWidget {
  int id;

  WeChatTabWidget(this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WeChatTabWidgetState(this.id);
  }
}

class _WeChatTabWidgetState extends State<WeChatTabWidget>
    with AutomaticKeepAliveClientMixin {
  List<WeChatTabDetailData> weChatDetailDataList = new List();

  ScrollController _scrollController = new ScrollController();
  int id;

  _WeChatTabWidgetState(this.id);

  int mOffset = 1;

  /**
   * 最大页数
   */
  int pageCount = 1;

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
        print("已经滑动到底部，加载更多数据!");
        mOffset = mOffset + 1;
        if (mOffset > pageCount) {
          mOffset = pageCount;
          print("已经滑到最咯--->" + pageCount.toString());
          Fluttertoast.showToast(
              msg: "已经到最后咯-_-",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white);
        } else {
          queryWeChatTabData();
        }
      }
    });
    queryWeChatTabData();
  }

  void queryWeChatTabData() {
    String url = "https://wanandroid.com/wxarticle/list/" +
        this.id.toString() +
        "/" +
        this.mOffset.toString() +
        "/json";

    print("queryWeChatTabData url --> " + url);
    NetClient.getInstance().get(url, (response) {
      WeChatTabResponseData tabResponseData =
          WeChatTabResponseData.fromJson(response.data);
      if (tabResponseData.errorCode == AppConstants.SUC_CODE) {
        setState(() {
          pageCount = tabResponseData.data.pageCount;
          if (tabResponseData.data != null) {
            for (WeChatTabDetailData data in tabResponseData.data.datas) {
              if (!weChatDetailDataList.contains(data)) {
                //防止重复添加，复写hashcode和==方法，根据id比较
                weChatDetailDataList.add(data);
              }
            }
          }
        });
      } else {
        print("请求失败，errorCode--->" +
            tabResponseData.errorCode.toString() +
            ", errorMsg--->" +
            tabResponseData.errorMsg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (weChatDetailDataList == null || weChatDetailDataList.length == 0) {
      return Container(
        child: CupertinoActivityIndicator(),
        margin: EdgeInsets.only(top: 20),
      );
    } else {
      // TODO: implement build
      return new Container(
        height: 600,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount:
              weChatDetailDataList == null ? 0 : weChatDetailDataList.length,
          itemBuilder: (BuildContext context, int position) {
            return ProjectItemWidget(weChatDetailDataList[position]);
          },
        ),
      );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ProjectItemWidget extends StatelessWidget {
  WeChatTabDetailData projectTabDetailData;

  ProjectItemWidget(this.projectTabDetailData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: new Container(
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Text(
                  projectTabDetailData.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              ),
              new Padding(padding: EdgeInsets.only(top: 15)),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "公众号",
                      style: new TextStyle(
                        color: Color(0xFF228B22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(left: 5)),
                    new Container(
                      child: new Icon(
                        Icons.access_time,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                      margin: EdgeInsets.only(top: 3),
                    ),
                    new Container(
                      child: new Text(projectTabDetailData.niceDate),
                      margin: EdgeInsets.only(top: 5),
                    ),
                    new Padding(padding: EdgeInsets.only(left: 3)),
                    new Text(
                      "@" + projectTabDetailData.author,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print("点击了：" + projectTabDetailData.title);
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) {
            return new WebViewPage(projectTabDetailData);
            //link,
            // title为需要传递的参数
          },
        ));
      },
    );
  }
}
