import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const BASE_URL = 'https://yuque.com/api/v2';
const USER_INFO_URL = '$BASE_URL/user';
const USER_REPOS_URL = '$BASE_URL/users/383674/repos';

_getHeader({token}) {
  Map<String, String> header = {
    'X-Auth-Token': token ?? 'cRVCHKp15mUWkpLrmOYIrT23tg8O8oAkPmOiBRzx'
  };
  return header;
}

num _getUserId() {
  return 383674;
}

typedef TokenInfo = void Function(Map<String, dynamic> info);

checkToken(token, {TokenInfo onSuccess, onError}) {
  final url = 'https://www.yuque.com/api/v2/user';
  fetch(url, token: token, onSuccess: (res) {
    if (res['status'] == 401) {
      commonErrorHandler(onError, '401');
    } else {
      onSuccess(res['data']);
    }
  }, onError: onError);
}

fetchDocs(namespace, {onSuccess, onError}) async {
  final url = '$BASE_URL/repos/$namespace/docs';
  await fetch(url, onSuccess: onSuccess, onError: onError);
}

fetchDoc(namespace, id, {onSuccess, onError}) async {
  final url = '$BASE_URL/repos/$namespace/docs/$id';
  await fetch(url, onSuccess: onSuccess, onError: onError);
}

fetch(url, {onSuccess, onError, token}) async {
  print('fetch: $url');
  final header = _getHeader(token: token);
  try {
    http.Response r = await http.get(url, headers: header);

    if (r.statusCode != 200) {
      commonErrorHandler(onError, r.statusCode);
      return;
    }

    final result = json.decode(r.body);
    if (onSuccess != null) onSuccess(result);
  } catch (err) {
    commonErrorHandler(onError, err);
  }
}

commonErrorHandler(onError, content) {
  if (onError != null) {
    onError(content);
  }
  print(content);
}
