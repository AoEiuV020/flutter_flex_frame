import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final SharedPreferences _prefs;
  static const String _tokenKey = 'auth_token';
  static const String _usernameKey = 'username';

  _AuthStore(this._prefs) {
    _init();
  }

  void _init() {
    final savedToken = _prefs.getString(_tokenKey);
    final savedUsername = _prefs.getString(_usernameKey);
    if (savedToken != null && savedUsername != null) {
      _token = savedToken;
      _currentUser = savedUsername;
      _isLoggedIn = true;
    }
  }

  @observable
  bool _isLoggedIn = false;

  @observable
  String? _token;

  @observable
  String? _currentUser;

  @observable
  String? error;

  @computed
  bool get isLoggedIn => _isLoggedIn;

  @computed
  String? get token => _token;

  @computed
  String? get currentUser => _currentUser;

  @action
  Future<bool> login(String username, String password) async {
    error = null;

    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));

    // 模拟验证
    if ((username == 'admin' && password == 'admin123') ||
        (username == 'demo' && password == 'demo123')) {
      _isLoggedIn = true;
      _currentUser = username;
      // 生成模拟 token
      _token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';

      // 保存到本地存储
      await _prefs.setString(_tokenKey, _token!);
      await _prefs.setString(_usernameKey, _currentUser!);

      return true;
    }

    error = '用户名或密码错误';
    return false;
  }

  @action
  Future<void> logout() async {
    // 先清除本地存储
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_usernameKey);

    // 然后更新状态
    _isLoggedIn = false;
    _currentUser = null;
    _token = null;
    error = null;
  }
}
