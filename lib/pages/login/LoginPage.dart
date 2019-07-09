import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android_flutter/bean/login/LoginResponseData.dart';
import 'package:wan_android_flutter/network/NetClient.dart';
import 'package:wan_android_flutter/pages/login/RegisterPage.dart';
import 'package:wan_android_flutter/util/TextUtil.dart';

/**
 * 登录页面
 */
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String mUsername;
  String mPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF508bed),
      body: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 100),
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new TextField(
                  maxLength: 20,
                  maxLengthEnforced: true,
                  onChanged: (text) {
                    mUsername = text;
                  },
                  decoration: new InputDecoration(
                    hintText: "请输入用户名",
                    //取消右下角的计数器
                    counterText: "",
                    contentPadding: EdgeInsets.only(
                      left: 10,
                      top: 20,
                      bottom: 10,
                    ),
                  ),
                  style: new TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 1,
                ),
                new TextField(
                  onChanged: (text) {
                    mPassword = text;
                  },
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "请输入密码",
                    contentPadding: EdgeInsets.only(
                      left: 10,
                      top: 20,
                      bottom: 10,
                    ),
                    border: InputBorder.none,
                  ),
                  style: new TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 30),
            width: 300,
            height: 45,
            child: new RaisedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (TextUtil.isEmpty(mUsername) ||
                    TextUtil.isEmpty(mPassword)) {
                  Fluttertoast.showToast(
                      msg: "用户名活密码为空！",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white);
                  return;
                }
                if (mUsername.length < 6) {
                  Fluttertoast.showToast(
                      msg: "用户名为6-20位！",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white);
                  return;
                }
                login();
              },
              child: new Text(
                "登录",
                style: new TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 20),
            width: 300,
            height: 45,
            child: new RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new RegisterPage();
                }));
              },
              child: new Text(
                "注册",
                style: new TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() {
    print("开始登录 " + mUsername + "@" + mPassword);
    String loginUrl = "https://www.wanandroid.com/user/login";
    var params = {"username": mUsername, "password": mPassword};
    FormData loginParams = FormData.from(params);
    NetClient.getInstance().post(loginUrl, (response) {
      print("登录结果：" + response.data.toString());
      LoginResponseData loginResponseData =
          LoginResponseData.fromJson(response.data);
      if (loginResponseData != null && 0 == loginResponseData.errorCode) {
        Fluttertoast.showToast(
            msg: "登录成功！",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white);
        new Timer(new Duration(seconds: 1), () {
          Navigator.pop(context);
        });
      } else {
        String errorMsg = "其他原因";
        if (loginResponseData != null) {
          errorMsg = loginResponseData.errorMsg +
              "[" +
              loginResponseData.errorCode.toString() +
              "]";
          Fluttertoast.showToast(
              msg: "登录失败：" + errorMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white);
        }
      }
    }, params: loginParams);
  }
}
