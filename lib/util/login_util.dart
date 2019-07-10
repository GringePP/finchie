import 'package:shared_preferences/shared_preferences.dart';
import 'package:finchie/constant/constant.dart';

bool isLogin() {
  return false;
}

Future<void> saveToken(token) async {
  return SharedPreferences.getInstance().then((sp) {
    sp.setString(SP_TOKEN, token);
  });
}
