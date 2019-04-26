import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:wan_android_flutter/bean/banner/BannerData.dart';
import 'package:wan_android_flutter/bean/banner/BannerResponseData.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'package:banner/banner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui' as ui;

import 'package:wan_android_flutter/network/NetClient.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BannerWidgetState();
  }
}

class _BannerWidgetState extends State<BannerWidget> {
  List<BannerData> bannerDataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queryBannerData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildBanner(context);
  }

  void queryBannerData() {
    print("queryBannerData");
    NetClient.getInstance().get("https://www.wanandroid.com/banner/json",
        (response) {
      print(response.data);
      BannerResponseData data = BannerResponseData.fromJson(response.data);
      if (data.errorCode == AppConstants.SUC_CODE) {
        setState(() {
          print("setData : " + data.data.toString());
          this.bannerDataList = data.data;
        });
      }
    });
  }

  Widget _buildBanner(BuildContext context) {
    print("_buildBanner : " + (null == this.bannerDataList).toString());
    if (null == this.bannerDataList || this.bannerDataList.length <= 0) {
      return Center(
        child: Text("Loading"),
      );
    } else {
      double screenWidth = MediaQueryData.fromWindow(ui.window).size.width;
      return Container(
        height: screenWidth * 500 / 900,
        width: screenWidth,
        child: Card(
          elevation: 5.0,
          shape: Border(),
          margin: EdgeInsets.all(0.0),
          child: BannerView(
            data: bannerDataList,
            delayTime: 10,
            onBannerClickListener: (int index, dynamic itemData) {
              print("点击了：" + index.toString());
            },
            buildShowView: (index, data) {
              return CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 0),
                fadeOutDuration: Duration(milliseconds: 0),
                imageUrl: (data as BannerData).imagePath,
              );
            },
          ),
        ),
      );
    }
  }
}
