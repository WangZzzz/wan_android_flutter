import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/login/LoginPage.dart';

/**
 * 我页面，上方，登录模块
 */
class PreLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new LoginPage()));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 15),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              child: new Text(
                "登录/注册",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
              margin: EdgeInsets.only(left: 30, top: 20, bottom: 20),
            ),
            new Padding(
              padding: EdgeInsets.only(right: 20),
              child: new Icon(
                Icons.arrow_forward,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
