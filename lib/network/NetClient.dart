import 'package:dio/dio.dart';
import 'package:wan_android_flutter/common/AppConstants.dart';
import 'dart:convert';

class NetClient {
  static NetClient sInstance;

  //单位是毫秒
  static final int CONNECTION_TIME_OUT = 20000;
  static final String GET = "get";
  static final String POST = "post";
  static final String DATA = "data";
  static final String CODE = "errorCode";

  Dio dio;
  Options options;

  static NetClient getInstance() {
    if (sInstance == null) {
      sInstance = new NetClient();
    }
    return sInstance;
  }

  NetClient() {
    print('dio赋值');
    // 或者通过传递一个 `options`来创建dio实例
    dio = new Dio(new BaseOptions(
      baseUrl: AppConstants.BASE_SERVER_URL,
      connectTimeout: CONNECTION_TIME_OUT,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: {},
    ));
  }

  //get请求
  get(String url, Function successCallBack,
      {params, Function errorCallBack}) async {
    _requestHttp(url, successCallBack, GET, params, null, errorCallBack);
  }

  //post请求
  post(String url, Function successCallBack,
      {FormData params, Function errorCallBack}) async {
    _requestHttp(url, successCallBack, POST, null, params, errorCallBack);
  }

  _requestHttp(String url, Function successCallBack,
      [String method,
      Map<String, dynamic> params,
      FormData formData,
      Function errorCallBack]) async {
    String errorMsg = '';
    int code;

    try {
      Response response;
//      _addStartHttpInterceptor(dio); //添加请求之前的拦截器
      if (method == GET) {
        if (params != null) {
          response = await dio.get(url, queryParameters: params);
        } else {
          print("dio.get(url)");
          response = await dio.get(url);
        }
      } else if (method == POST) {
        if (params != null) {
          response = await dio.post(url, data: formData);
        } else {
          response = await dio.post(url);
        }
      }

      code = response.statusCode;
      if (code != 200) {
        errorMsg = '错误码：' + code.toString() + '，' + response.data.toString();
        _error(errorCallBack, errorMsg);
        return;
      }

//      String dataStr = json.encode(response.data);
//      Map<String, dynamic> dataMap = json.decode(dataStr);
//      if (dataMap != null && dataMap[CODE] != 0) {
//        errorMsg =
//            '错误码：' + dataMap[CODE].toString() + '，' + response.data.toString();
//        _error(errorCallBack, errorMsg);
//        return;
//      }
//
//      if (successCallBack != null) {
//        successCallBack(dataMap[DATA]);
//      }
      if (successCallBack != null) {
        successCallBack(response);
      }
    } catch (exception) {
      _error(errorCallBack, exception.toString());
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

//  _addStartHttpInterceptor(Dio dio) {
//    dio.interceptor.request.onSend = (Options options) {
//      // 在请求被发送之前做一些事情   比如加密的一些操作 或者添加token等参数 对head 或者请求参数进行加工处理
//      Map<String, dynamic> headers = options.headers;
//      Map<String, dynamic> body = options.extra;
//      /*request['token'] = '1111111111';
//      headers['addParam'] = 'aaaaaaaaaaaaaaa';*/
//      return options;
//    };
//  }
}
