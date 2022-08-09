// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationsStore on _LocationsStore, Store {
  Computed<Location>? _$startComputed;

  @override
  Location get start => (_$startComputed ??=
          Computed<Location>(() => super.start, name: '_LocationsStore.start'))
      .value;
  Computed<Location>? _$finishComputed;

  @override
  Location get finish =>
      (_$finishComputed ??= Computed<Location>(() => super.finish,
              name: '_LocationsStore.finish'))
          .value;
  Computed<List<Location>>? _$waypointsComputed;

  @override
  List<Location> get waypoints =>
      (_$waypointsComputed ??= Computed<List<Location>>(() => super.waypoints,
              name: '_LocationsStore.waypoints'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_LocationsStore.isLoading', context: context);

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

  late final _$selectedLocationAtom =
      Atom(name: '_LocationsStore.selectedLocation', context: context);

  @override
  Location? get selectedLocation {
    _$selectedLocationAtom.reportRead();
    return super.selectedLocation;
  }

  @override
  set selectedLocation(Location? value) {
    _$selectedLocationAtom.reportWrite(value, super.selectedLocation, () {
      super.selectedLocation = value;
    });
  }

  late final _$blackSeaLocationsAtom =
      Atom(name: '_LocationsStore.blackSeaLocations', context: context);

  @override
  ObservableMap<String, List<Location>> get blackSeaLocations {
    _$blackSeaLocationsAtom.reportRead();
    return super.blackSeaLocations;
  }

  @override
  set blackSeaLocations(ObservableMap<String, List<Location>> value) {
    _$blackSeaLocationsAtom.reportWrite(value, super.blackSeaLocations, () {
      super.blackSeaLocations = value;
    });
  }

  late final _$includedLocationsAtom =
      Atom(name: '_LocationsStore.includedLocations', context: context);

  @override
  ObservableList<Location> get includedLocations {
    _$includedLocationsAtom.reportRead();
    return super.includedLocations;
  }

  @override
  set includedLocations(ObservableList<Location> value) {
    _$includedLocationsAtom.reportWrite(value, super.includedLocations, () {
      super.includedLocations = value;
    });
  }

  late final _$notIncludedLocationsAtom =
      Atom(name: '_LocationsStore.notIncludedLocations', context: context);

  @override
  ObservableList<Location> get notIncludedLocations {
    _$notIncludedLocationsAtom.reportRead();
    return super.notIncludedLocations;
  }

  @override
  set notIncludedLocations(ObservableList<Location> value) {
    _$notIncludedLocationsAtom.reportWrite(value, super.notIncludedLocations,
        () {
      super.notIncludedLocations = value;
    });
  }

  late final _$_LocationsStoreActionController =
      ActionController(name: '_LocationsStore', context: context);

  @override
  void setCurrentLocation(Location? location) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setCurrentLocation');
    try {
      return super.setCurrentLocation(location);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedLocation(Location? location) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setSelectedLocation');
    try {
      return super.setSelectedLocation(location);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool loading) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setLoading');
    try {
      return super.setLoading(loading);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIncludedLocations(List<Location> _includedLocations) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setIncludedLocations');
    try {
      return super.setIncludedLocations(_includedLocations);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotIncludedLocations(List<Location> _notIncludedLocations) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setNotIncludedLocations');
    try {
      return super.setNotIncludedLocations(_notIncludedLocations);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBlackSeaLocation(Map<String, List<Location>> locations) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.setBlackSeaLocation');
    try {
      return super.setBlackSeaLocation(locations);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCurrentLocation() {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.clearCurrentLocation');
    try {
      return super.clearCurrentLocation();
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentLocation: ${currentLocation},
selectedLocation: ${selectedLocation},
blackSeaLocations: ${blackSeaLocations},
includedLocations: ${includedLocations},
notIncludedLocations: ${notIncludedLocations},
start: ${start},
finish: ${finish},
waypoints: ${waypoints}
    ''';
  }
}
