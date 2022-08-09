// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locales_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalesStore on _LocalesStore, Store {
  Computed<String>? _$generalLocaleComputed;

  @override
  String get generalLocale =>
      (_$generalLocaleComputed ??= Computed<String>(() => super.generalLocale,
              name: '_LocalesStore.generalLocale'))
          .value;

  late final _$currentLocaleAtom =
      Atom(name: '_LocalesStore.currentLocale', context: context);

  @override
  String get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(String value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  late final _$localesAtom =
      Atom(name: '_LocalesStore.locales', context: context);

  @override
  ObservableList<Locale> get locales {
    _$localesAtom.reportRead();
    return super.locales;
  }

  @override
  set locales(ObservableList<Locale> value) {
    _$localesAtom.reportWrite(value, super.locales, () {
      super.locales = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LocalesStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_LocalesStoreActionController =
      ActionController(name: '_LocalesStore', context: context);

  @override
  dynamic setLocales(List<Locale> _locales) {
    final _$actionInfo = _$_LocalesStoreActionController.startAction(
        name: '_LocalesStore.setLocales');
    try {
      return super.setLocales(_locales);
    } finally {
      _$_LocalesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentLocale(String locale) {
    final _$actionInfo = _$_LocalesStoreActionController.startAction(
        name: '_LocalesStore.setCurrentLocale');
    try {
      return super.setCurrentLocale(locale);
    } finally {
      _$_LocalesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_LocalesStoreActionController.startAction(
        name: '_LocalesStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LocalesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocale: ${currentLocale},
locales: ${locales},
isLoading: ${isLoading},
generalLocale: ${generalLocale}
    ''';
  }
}
