import 'package:flutter/material.dart';
import 'package:wan_android_flutter/bean/project/ProjectTabDetailData.dart';
import 'package:wan_android_flutter/bean/project/ProjectTabResponseData.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'package:wan_android_flutter/network/NetClient.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android_flutter/pages/WebViewPage.dart';

class ProjectTabWidget extends StatefulWidget {
  int cid;

  ProjectTabWidget(this.cid);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProjectTabWidgetState(this.cid);
  }
}

class _ProjectTabWidgetState extends State<ProjectTabWidget> with AutomaticKeepAliveClientMixin {
  List<ProjectTabDetailData> projectDetailDataList = new List();

  ScrollController _scrollController = new ScrollController();
  int cid;

  _ProjectTabWidgetState(this.cid);

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
          queryProjectTabData();
        }
      }
    });
    queryProjectTabData();
  }

  void queryProjectTabData() {
    String url = "https://www.wanandroid.com/project/list/" +
        mOffset.toString() +
        "/json?cid=" +
        this.cid.toString();
    print("queryProjectTabData url --> " + url);
    NetClient.getInstance().get(url, (response) {
      ProjectTabResponseData tabResponseData =
          ProjectTabResponseData.fromJson(response.data);
      if (tabResponseData.errorCode == AppConstants.SUC_CODE) {
        setState(() {
          pageCount = tabResponseData.data.pageCount;
          if (tabResponseData.data != null) {
            for (ProjectTabDetailData data in tabResponseData.data.datas) {
              if (!projectDetailDataList.contains(data)) {
                //防止重复添加，复写hashcode和==方法，根据id比较
                projectDetailDataList.add(data);
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
    // TODO: implement build
    return new Container(
      height: 600,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount:
            projectDetailDataList == null ? 0 : projectDetailDataList.length,
        itemBuilder: (BuildContext context, int position) {
          return ProjectItemWidget(projectDetailDataList[position]);
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ProjectItemWidget extends StatelessWidget {
  ProjectTabDetailData projectTabDetailData;

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
              new Padding(padding: EdgeInsets.only(top: 10)),
              new Container(
                child: new Text(
                  projectTabDetailData.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
              ),
              new Padding(padding: EdgeInsets.only(top: 15)),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.access_time,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                    new Padding(padding: EdgeInsets.only(left: 5)),
                    new Text(projectTabDetailData.niceDate),
                    new Padding(padding: EdgeInsets.only(left: 5)),
                    new Text("@" + projectTabDetailData.author),
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
            return new WebViewPage(
              projectTabDetailData.link,
              projectTabDetailData.title,
            );
            //link,
            // title为需要传递的参数
          },
        ));
      },
    );
  }
}
