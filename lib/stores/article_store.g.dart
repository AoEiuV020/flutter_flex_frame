// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleStore on _ArticleStore, Store {
  Computed<bool>? _$isReadComputed;

  @override
  bool get isRead => (_$isReadComputed ??=
          Computed<bool>(() => super.isRead, name: '_ArticleStore.isRead'))
      .value;
  Computed<bool>? _$isStarredComputed;

  @override
  bool get isStarred =>
      (_$isStarredComputed ??= Computed<bool>(() => super.isStarred,
              name: '_ArticleStore.isStarred'))
          .value;

  late final _$toggleReadAsyncAction =
      AsyncAction('_ArticleStore.toggleRead', context: context);

  @override
  Future<void> toggleRead() {
    return _$toggleReadAsyncAction.run(() => super.toggleRead());
  }

  late final _$toggleStarredAsyncAction =
      AsyncAction('_ArticleStore.toggleStarred', context: context);

  @override
  Future<void> toggleStarred() {
    return _$toggleStarredAsyncAction.run(() => super.toggleStarred());
  }

  @override
  String toString() {
    return '''
isRead: ${isRead},
isStarred: ${isStarred}
    ''';
  }
}
