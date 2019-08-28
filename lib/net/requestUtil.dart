import 'package:demo_test/bean/h5netaddress.dart';
import 'package:demo_test/net/api.dart';
import 'package:demo_test/net/intercept/base_intercept.dart';
import 'package:rxdart/rxdart.dart';

class RequestMap {
  static PublishSubject<NetUrlBeanEntity> requestLogin<BaseResponse>(
      BaseIntercept baseIntercept) {
    String url = "http://t.channel.45xie.com/api/api?action=adapi";
    NetUrlBeanEntity netUrlBeanEntity =
        NetUrlBeanEntity(); //模拟 带参数，直接对象转json就可以了
//    netUrlBeanEntity.error = false;
    return HttpManager().get<NetUrlBeanEntity>(url,
        queryParameters: netUrlBeanEntity.toJson(),
        baseIntercept: baseIntercept,
        isCancelable: false);
  }

  static PublishSubject testErrorrequest(BaseIntercept baseIntercept) {
    String urlError = "error";
    return HttpManager().get<NetUrlBeanEntity>(urlError = "error",
        baseIntercept: baseIntercept);
  }
}
