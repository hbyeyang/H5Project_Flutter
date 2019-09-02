
import 'package:demo_test/net/requestHttp.dart';

export 'package:dio/dio.dart';

class HttpApi {
  factory HttpApi() => _getInstance();

  static HttpApi get instance => _getInstance();
  static HttpApi _instance;

  static final int SUCCEED = 0;
  static final int FAILED = 1;

  HttpApi._internal() {
    ///初始化
  }

  static HttpApi _getInstance() {
    if (_instance == null) {
      _instance = new HttpApi._internal();
    }
    return _instance;
  }

  ///获取链接
  void getData({
    Function success,
    Function error,
    CancelToken token,
  }) {
    RequestHttp.getInstance().get(
//      "fUser/getSuggestion",
      "",//没有接口名称
      (data) {
        success(data);
      },
      errorCallBack: (errorMessage) {
        error(errorMessage);
      },
      token: token,
    );
  }
}
