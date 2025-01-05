import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isLoggedIn = false;

  @observable
  String? currentUser;

  @action
  Future<void> login(String username, String password) async {
    // TODO: Implement actual login logic
    await Future.delayed(const Duration(seconds: 1));
    isLoggedIn = true;
    currentUser = username;
  }

  @action
  Future<void> logout() async {
    isLoggedIn = false;
    currentUser = null;
  }
}
