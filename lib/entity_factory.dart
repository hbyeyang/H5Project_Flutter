import 'package:demo_test/bean/linksData.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "Data") {
      return Data.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
