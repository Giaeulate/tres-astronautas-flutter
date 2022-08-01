import 'package:flutter/cupertino.dart';
import 'package:tres_astronauntas_demo/api/api_service.dart';
import 'package:tres_astronauntas_demo/global/custom_alert.dart';
import 'package:tres_astronauntas_demo/global/local_storage.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;

  bool _checkRemember = false, _loading = false;

  String? get token => _token;

  bool get checkRemember => _checkRemember;
  set checkRemember(bool val) {
    _checkRemember = val;
    notifyListeners();
  }

  bool get loading => _loading;
  set loading(bool val) {
    _loading = val;
    notifyListeners();
  }

  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    Future.delayed(const Duration(seconds: 1), () => isAuthenticated());
  }

  saveLocalStorageCredential(dynamic resp) async {
    await LocalStorage.sharedPreferences.setString('token', resp["token"]);
  }

  login(BuildContext context, String user, String password) async {
    _loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    dynamic resp = await loginApi(user, password);
    if (resp["status"] != null && resp["status"] == false) {
      // ignore: use_build_context_synchronously
      showCustomAlert(context, "Error", "${resp['message']}");
    } else {
      authStatus = AuthStatus.authenticated;
      notifyListeners();
    }
    _loading = false;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    authStatus = AuthStatus.checking;
    final token = LocalStorage.sharedPreferences.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    await Future.delayed(const Duration(seconds: 1));
    _token = token;
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
