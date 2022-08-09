// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wineries_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WineriesStore on _WineriesStore, Store {
  late final _$wineriesAtom =
      Atom(name: '_WineriesStore.wineries', context: context);

  @override
  ObservableList<Winery> get wineries {
    _$wineriesAtom.reportRead();
    return super.wineries;
  }

  @override
  set wineries(ObservableList<Winery> value) {
    _$wineriesAtom.reportWrite(value, super.wineries, () {
      super.wineries = value;
    });
  }

  late final _$currentWineryIdAtom =
      Atom(name: '_WineriesStore.currentWineryId', context: context);

  @override
  int get currentWineryId {
    _$currentWineryIdAtom.reportRead();
    return super.currentWineryId;
  }

  @override
  set currentWineryId(int value) {
    _$currentWineryIdAtom.reportWrite(value, super.currentWineryId, () {
      super.currentWineryId = value;
    });
  }

  late final _$wineryAtom =
      Atom(name: '_WineriesStore.winery', context: context);

  @override
  Winery? get winery {
    _$wineryAtom.reportRead();
    return super.winery;
  }

  @override
  set winery(Winery? value) {
    _$wineryAtom.reportWrite(value, super.winery, () {
      super.winery = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_WineriesStore.isLoading', context: context);

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

  late final _$_WineriesStoreActionController =
      ActionController(name: '_WineriesStore', context: context);

  @override
  void setWineries(List<Winery> _wineries) {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.setWineries');
    try {
      return super.setWineries(_wineries);
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWinery(Winery _winery) {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.setWinery');
    try {
      return super.setWinery(_winery);
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentWineryId(int wineryId) {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.setCurrentWineryId');
    try {
      return super.setCurrentWineryId(wineryId);
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortedByRating() {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.sortedByRating');
    try {
      return super.sortedByRating();
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortedByAlphabet() {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.sortedByAlphabet');
    try {
      return super.sortedByAlphabet();
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortedByGPS(Position currentLocation) {
    final _$actionInfo = _$_WineriesStoreActionController.startAction(
        name: '_WineriesStore.sortedByGPS');
    try {
      return super.sortedByGPS(currentLocation);
    } finally {
      _$_WineriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wineries: ${wineries},
currentWineryId: ${currentWineryId},
winery: ${winery},
isLoading: ${isLoading}
    ''';
  }
}
