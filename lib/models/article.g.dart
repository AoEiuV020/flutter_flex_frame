// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Article on _Article, Store {
  late final _$isReadAtom = Atom(name: '_Article.isRead', context: context);

  @override
  bool get isRead {
    _$isReadAtom.reportRead();
    return super.isRead;
  }

  @override
  set isRead(bool value) {
    _$isReadAtom.reportWrite(value, super.isRead, () {
      super.isRead = value;
    });
  }

  late final _$isStarredAtom =
      Atom(name: '_Article.isStarred', context: context);

  @override
  bool get isStarred {
    _$isStarredAtom.reportRead();
    return super.isStarred;
  }

  @override
  set isStarred(bool value) {
    _$isStarredAtom.reportWrite(value, super.isStarred, () {
      super.isStarred = value;
    });
  }

  late final _$_ArticleActionController =
      ActionController(name: '_Article', context: context);

  @override
  void toggleRead() {
    final _$actionInfo =
        _$_ArticleActionController.startAction(name: '_Article.toggleRead');
    try {
      return super.toggleRead();
    } finally {
      _$_ArticleActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleStarred() {
    final _$actionInfo =
        _$_ArticleActionController.startAction(name: '_Article.toggleStarred');
    try {
      return super.toggleStarred();
    } finally {
      _$_ArticleActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markRead() {
    final _$actionInfo =
        _$_ArticleActionController.startAction(name: '_Article.markRead');
    try {
      return super.markRead();
    } finally {
      _$_ArticleActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markUnread() {
    final _$actionInfo =
        _$_ArticleActionController.startAction(name: '_Article.markUnread');
    try {
      return super.markUnread();
    } finally {
      _$_ArticleActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRead: ${isRead},
isStarred: ${isStarred}
    ''';
  }
}
