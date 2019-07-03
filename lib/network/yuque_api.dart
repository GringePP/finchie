import 'dart:convert';

import 'package:http/http.dart' as http;

const BASE_URL = 'https://yuque.com/api/v2';
const USER_INFO_URL = '$BASE_URL/user';
const USER_REPOS_URL = '$BASE_URL/users/383674/repos';

_getHeader() {
  Map<String, String> header = {
    'X-Auth-Token': 'cRVCHKp15mUWkpLrmOYIrT23tg8O8oAkPmOiBRzx'
  };
  return header;
}

num _getUserId() {
  return 383674;
}

fetchDocs(namespace, {onSuccess, onError}) async {
  final url = '$BASE_URL/repos/$namespace/docs';
  await fetch(url, onSuccess: onSuccess, onError: onError);
}

fetch(url, {onSuccess, onError}) async {
  print('fetch: $url');
  final header = _getHeader();
  try {
    http.Response r = await http.get(url, headers: header);

    if (r.statusCode != 200) {
      commonErrorHandler(onError, r.statusCode);
      return;
    }

    final result = json.decode(r.body);
    if (onSuccess != null) onSuccess(result['data']);
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
