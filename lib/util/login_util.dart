import 'package:finchie/network/yuque_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:finchie/constant/constant.dart';

Future<Map<String, dynamic>> checkLogin() async {
  Future f = SharedPreferences.getInstance();
  return f.then((sp) {
    final token = sp.getString(SP_TOKEN);
    if (token == null) return null;
    final userId = sp.getInt(SP_USERID);
    return {"token": token, "user_id": userId};
  });
}

Future<void> login(token, userid) async {
  return SharedPreferences.getInstance().then((sp) {
    sp.setString(SP_TOKEN, token);
    sp.setInt(SP_USERID, userid);
  }).then((_) {
    updateToken(token);
    updateUserId(userid);
  });
}

// Future<void> saveLoginInfo(token, userid) async {
//   return SharedPreferences.getInstance().then((sp) {
//     sp.setString(SP_TOKEN, token);
//     sp.setInt(SP_USERID, userid);
//   });
// }

Future<void> saveToken(token) async {
  return SharedPreferences.getInstance().then((sp) {
    sp.setString(SP_TOKEN, token);
  });
}

Future<void> logout() async {
  return SharedPreferences.getInstance().then((sp) {
    sp.remove(SP_USERID);
    sp.remove(SP_TOKEN);
  });
}
