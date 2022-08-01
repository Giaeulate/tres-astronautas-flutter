import 'dart:convert';
import 'package:tres_astronauntas_demo/global/environment.dart';
import 'package:http/http.dart' as http;
import 'package:tres_astronauntas_demo/global/local_storage.dart';

Future<dynamic> postApi(String url, dynamic data, {dynamic headers}) async {
  final http.Response response = await http.post(
    Uri.parse('${Environment.url}/$url'),
    headers: headers ?? {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {"status": false, "message": "Server Error"};
    }
    dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
    resp["status"] = false;
    return resp;
  }
}

Future<dynamic> putApi(String url, String id, dynamic data,
    {dynamic headers}) async {
  final http.Response response = await http.put(
    Uri.parse('${Environment.url}/$url/$id'),
    headers: headers ?? {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {"status": false, "message": "Server Error"};
    }
    dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
    resp["status"] = false;
    return resp;
  }
}

Future<dynamic> deleteApi(String url, String id, {dynamic headers}) async {
  final http.Response response = await http.delete(
    Uri.parse('${Environment.url}/$url/$id'),
    headers: headers ?? {'Content-Type': 'application/json'},
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {"status": false, "message": "Server Error"};
    }
    dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
    resp["status"] = false;
    return resp;
  }
}

Future<dynamic> getApi(String url, {dynamic headers}) async {
  final http.Response response = await http.get(
    Uri.parse('${Environment.url}/$url'),
    headers: headers ?? {'Content-Type': 'application/json'},
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (response.statusCode >= 500) {
      return {"status": false, "message": "Server Error"};
    }
    dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
    resp["status"] = false;
    return resp;
  }
}

Future<dynamic> loginApi(String username, String password) async {
  dynamic data = {"email": username, "password": password};
  var resp = await postApi('api/v1/auth/login', data);
  try {
    await LocalStorage.sharedPreferences.setString('token', resp["token"]);
    return resp;
  } catch (e) {
    return resp;
  }
}
