import 'package:demo_test/bean/h5netaddress.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "NetUrlBeanEntity") {
      return NetUrlBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
