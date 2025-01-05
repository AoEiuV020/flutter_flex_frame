import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isLoggedIn = false;

  @observable
  String? currentUser;

  @observable
  String? error;

  @action
  Future<bool> login(String username, String password) async {
    error = null;
    // 模拟登录验证
    await Future.delayed(const Duration(seconds: 1));

    // 演示账号: admin/admin123 或 demo/demo123
    if ((username == 'admin' && password == 'admin123') ||
        (username == 'demo' && password == 'demo123')) {
      isLoggedIn = true;
      currentUser = username;
      return true;
    } else {
      error = '用户名或密码错误';
      return false;
    }
  }

  @action
  Future<void> logout() async {
    isLoggedIn = false;
    currentUser = null;
    error = null;
  }
}
