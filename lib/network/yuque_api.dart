import 'dart:convert';

import 'package:http/http.dart' as http;

const BASE_URL = 'https://yuque.com/api/v2';
const USER_INFO_URL = '$BASE_URL/user';

const HEADER = '';

_getHeader() {
  Map<String, String> header = {
    'X-Auth-Token': 'cRVCHKp15mUWkpLrmOYIrT23tg8O8oAkPmOiBRzx'
  };
  return header;
}

fetch(url, {onSuccess, onError}) async {
  final header = _getHeader();
  try {
    http.Response r = await http.get(url, headers: header);
    final result = json.decode(r.body);
    if (onSuccess != null) onSuccess(result['data']);
  } catch (err) {
    if(onError != null) onError(err);
  }
}
