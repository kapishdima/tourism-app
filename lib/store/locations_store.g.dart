// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationsStore on _LocationsStore, Store {
  late final _$currentLocationAtom =
      Atom(name: '_LocationsStore.currentLocation', context: context);

  @override
  Location? get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(Location? value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$inlucdedLocationFutureAtom =
      Atom(name: '_LocationsStore.inlucdedLocationFuture', context: context);

  @override
  ObservableFuture<List<Location>>? get inlucdedLocationFuture {
    _$inlucdedLocationFutureAtom.reportRead();
    return super.inlucdedLocationFuture;
  }

  @override
  set inlucdedLocationFuture(ObservableFuture<List<Location>>? value) {
    _$inlucdedLocationFutureAtom
        .reportWrite(value, super.inlucdedLocationFuture, () {
      super.inlucdedLocationFuture = value;
    });
  }

  late final _$notInlucdedLocationFutureAtom =
      Atom(name: '_LocationsStore.notInlucdedLocationFuture', context: context);

  @override
  ObservableFuture<List<Location>>? get notInlucdedLocationFuture {
    _$notInlucdedLocationFutureAtom.reportRead();
    return super.notInlucdedLocationFuture;
  }

  @override
  set notInlucdedLocationFuture(ObservableFuture<List<Location>>? value) {
    _$notInlucdedLocationFutureAtom
        .reportWrite(value, super.notInlucdedLocationFuture, () {
      super.notInlucdedLocationFuture = value;
    });
  }

  late final _$_LocationsStoreActionController =
      ActionController(name: '_LocationsStore', context: context);

  @override
  Future<dynamic> fetchIncludedLocations(int wayId) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.fetchIncludedLocations');
    try {
      return super.fetchIncludedLocations(wayId);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchNotIncludedLocations(int wayId) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.fetchNotIncludedLocations');
    try {
      return super.fetchNotIncludedLocations(wayId);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> filterNotIncludedLocations(int wayId, List<String> filters) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.filterNotIncludedLocations');
    try {
      return super.filterNotIncludedLocations(wayId, filters);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentLocation(Location location) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setCurrentLocation');
    try {
      return super.setCurrentLocation(location);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation},
inlucdedLocationFuture: ${inlucdedLocationFuture},
notInlucdedLocationFuture: ${notInlucdedLocationFuture}
    ''';
  }
}
