// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CountriesStore on _CountriesStore, Store {
  Computed<String>? _$currentNameComputed;

  @override
  String get currentName =>
      (_$currentNameComputed ??= Computed<String>(() => super.currentName,
              name: '_CountriesStore.currentName'))
          .value;

  late final _$regionsAtom =
      Atom(name: '_CountriesStore.regions', context: context);

  @override
  ObservableList<CountryRegion> get regions {
    _$regionsAtom.reportRead();
    return super.regions;
  }

  @override
  set regions(ObservableList<CountryRegion> value) {
    _$regionsAtom.reportWrite(value, super.regions, () {
      super.regions = value;
    });
  }

  late final _$countriesAtom =
      Atom(name: '_CountriesStore.countries', context: context);

  @override
  ObservableList<Country> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(ObservableList<Country> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  late final _$currentCountryAtom =
      Atom(name: '_CountriesStore.currentCountry', context: context);

  @override
  int get currentCountry {
    _$currentCountryAtom.reportRead();
    return super.currentCountry;
  }

  @override
  set currentCountry(int value) {
    _$currentCountryAtom.reportWrite(value, super.currentCountry, () {
      super.currentCountry = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CountriesStore.isLoading', context: context);

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

  late final _$_CountriesStoreActionController =
      ActionController(name: '_CountriesStore', context: context);

  @override
  void setCountries(List<Country> _countries) {
    final _$actionInfo = _$_CountriesStoreActionController.startAction(
        name: '_CountriesStore.setCountries');
    try {
      return super.setCountries(_countries);
    } finally {
      _$_CountriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentCountry(int countryId) {
    final _$actionInfo = _$_CountriesStoreActionController.startAction(
        name: '_CountriesStore.setCurrentCountry');
    try {
      return super.setCurrentCountry(countryId);
    } finally {
      _$_CountriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegions(List<CountryRegion> _regions) {
    final _$actionInfo = _$_CountriesStoreActionController.startAction(
        name: '_CountriesStore.setRegions');
    try {
      return super.setRegions(_regions);
    } finally {
      _$_CountriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CountriesStoreActionController.startAction(
        name: '_CountriesStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CountriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
regions: ${regions},
countries: ${countries},
currentCountry: ${currentCountry},
isLoading: ${isLoading},
currentName: ${currentName}
    ''';
  }
}
