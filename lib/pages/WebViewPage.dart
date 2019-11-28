import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:wan_android_flutter/bean/base/BaseDetailData.dart';

class WebViewPage extends StatefulWidget {
  BaseDetailData detailData;

  WebViewPage(this.detailData);

  @override
  State<StatefulWidget> createState() => new _WebViewPageState(this.detailData);
}

class _WebViewPageState extends State<WebViewPage> {
  BaseDetailData detailData;

  // 标记是否是加载中
  bool loading = true;

  // 标记当前页面是否是我们自定义的回调页面
  bool isLoadingCallbackPage = false;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  // URL变化监听器
  StreamSubscription<String> onUrlChanged;

  // WebView加载状态变化监听器
  StreamSubscription<WebViewStateChanged> onStateChanged;

  // 插件提供的对象，该对象用于WebView的各种操作
  FlutterWebviewPlugin flutterWebViewPlugin = new FlutterWebviewPlugin();

  _WebViewPageState(this.detailData);

  @override
  void initState() {
    onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      // state.type是一个枚举类型，取值有：WebViewState.shouldStart, WebViewState.startLoad, WebViewState.finishLoad
      switch (state.type) {
        case WebViewState.shouldStart:
          // 准备加载
          setState(() {
            loading = true;
          });
          break;
        case WebViewState.startLoad:
          // 开始加载
          break;
        case WebViewState.finishLoad:
          // 加载完成
          setState(() {
            loading = false;
          });
          if (isLoadingCallbackPage) {
            // 当前是回调页面，则调用js方法获取数据
            parseResult();
          }
          break;
        default:
          break;
      }
    });
  }

  // 解析WebView中的数据
  void parseResult() {
//    flutterWebViewPlugin.evalJavascript("get();").then((result) {
//      // result json字符串，包含token信息
//
//    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    List<Widget> titleContent = [];
    titleContent.add(new Container(
      child: new Text(
        this.detailData.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: new TextStyle(color: Colors.white),
      ),
      width: width * 3 / 5,
    ));
    titleContent.add(new Padding(padding: EdgeInsets.only(left: 10)));
    titleContent.add(new TitleLikeWidget(this.detailData));
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return new WebviewScaffold(
      key: scaffoldKey,
      url: this.detailData.link,
      // 登录的URL
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }

  @override
  void dispose() {
    // 回收相关资源
    // Every listener should be canceled, the same should be done with this stream.
    onUrlChanged.cancel();
    onStateChanged.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }
}

class TitleLikeWidget extends StatefulWidget {
  BaseDetailData detailData;

  TitleLikeWidget(this.detailData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TitleLikeWidgetState(this.detailData);
  }
}

class _TitleLikeWidgetState extends State<TitleLikeWidget> {
  BaseDetailData detailData;

  _TitleLikeWidgetState(this.detailData);

  bool loved = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (loved) {
      return new GestureDetector(
        onTap: () {
          setState(() {
            loved = false;
          });
        },
        child: new Icon(
          Icons.star,
          color: Colors.redAccent,
        ),
      );
    } else {
      return new GestureDetector(
        onTap: () {
          setState(() {
            loved = true;
          });
        },
        child: new Icon(
          Icons.star_border,
          color: Colors.redAccent,
        ),
      );
    }
  }
}
