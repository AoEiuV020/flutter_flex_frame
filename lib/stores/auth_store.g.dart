// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??=
          Computed<bool>(() => super.isLoggedIn, name: '_AuthStore.isLoggedIn'))
      .value;
  Computed<String?>? _$tokenComputed;

  @override
  String? get token => (_$tokenComputed ??=
          Computed<String?>(() => super.token, name: '_AuthStore.token'))
      .value;
  Computed<String?>? _$currentUserComputed;

  @override
  String? get currentUser =>
      (_$currentUserComputed ??= Computed<String?>(() => super.currentUser,
              name: '_AuthStore.currentUser'))
          .value;

  late final _$_isLoggedInAtom =
      Atom(name: '_AuthStore._isLoggedIn', context: context);

  @override
  bool get _isLoggedIn {
    _$_isLoggedInAtom.reportRead();
    return super._isLoggedIn;
  }

  @override
  set _isLoggedIn(bool value) {
    _$_isLoggedInAtom.reportWrite(value, super._isLoggedIn, () {
      super._isLoggedIn = value;
    });
  }

  late final _$_tokenAtom = Atom(name: '_AuthStore._token', context: context);

  @override
  String? get _token {
    _$_tokenAtom.reportRead();
    return super._token;
  }

  @override
  set _token(String? value) {
    _$_tokenAtom.reportWrite(value, super._token, () {
      super._token = value;
    });
  }

  late final _$_currentUserAtom =
      Atom(name: '_AuthStore._currentUser', context: context);

  @override
  String? get _currentUser {
    _$_currentUserAtom.reportRead();
    return super._currentUser;
  }

  @override
  set _currentUser(String? value) {
    _$_currentUserAtom.reportWrite(value, super._currentUser, () {
      super._currentUser = value;
    });
  }

  late final _$errorAtom = Atom(name: '_AuthStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future<bool> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
error: ${error},
isLoggedIn: ${isLoggedIn},
token: ${token},
currentUser: ${currentUser}
    ''';
  }
}
