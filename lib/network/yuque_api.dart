import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const BASE_URL = 'https://yuque.com/api/v2';
const USER_INFO_URL = '$BASE_URL/user';
const USER_REPOS_URL = '$BASE_URL/users/383674/repos';

String _token;
String _userId;

updateToken(token) {
  _token = token;
}

updateUserId(userId) {
  _userId = userId;
}

_getHeader({token}) {
  Map<String, String> header = {'X-Auth-Token': token ?? _token};
  return header;
}

typedef TokenInfo = void Function(Map<String, dynamic> info);

verifyToken(token, {TokenInfo onSuccess, onError}) async {
  final url = 'https://www.yuque.com/api/v2/user';
  fetch(url, token: token, onSuccess: (res) {
    if (res['status'] == 401) {
      commonErrorHandler(onError, '401');
    } else {
      onSuccess(res['data']);
    }
  }, onError: onError);
}

fetchDocs(namespace, {onSuccess, onError}) {
  final url = '$BASE_URL/repos/$namespace/docs';
  fetch(url, onSuccess: onSuccess, onError: onError);
}

fetchDoc(namespace, id, {onSuccess, onError}) {
  final url = '$BASE_URL/repos/$namespace/docs/$id';
  fetch(url, onSuccess: onSuccess, onError: onError);
}

Future<void> fetchRepos({onSuccess, onError}) async {
  final url = BASE_URL + '/users/' + _userId + '/repos';
  return fetch(url, onSuccess: onSuccess, onError: onError);
}

fetch(url, {onSuccess, onError, token}) {
  print('fetch: $url');
  final header = _getHeader(token: token);
  return http.get(url, headers: header).then((res) {
    if (res.statusCode != 200) {
      commonErrorHandler(onError, res.statusCode);
    } else {
      final result = json.decode(res.body);
      if (onSuccess != null) onSuccess(result);
    }
  });
}

commonErrorHandler(onError, content) {
  if (onError != null) {
    onError(content);
  }
  print(content);
}
