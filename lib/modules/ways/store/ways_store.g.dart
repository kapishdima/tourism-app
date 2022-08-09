// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ways_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WaysStore on _WaysStore, Store {
  late final _$waysAtom = Atom(name: '_WaysStore.ways', context: context);

  @override
  ObservableList<dynamic> get ways {
    _$waysAtom.reportRead();
    return super.ways;
  }

  @override
  set ways(ObservableList<dynamic> value) {
    _$waysAtom.reportWrite(value, super.ways, () {
      super.ways = value;
    });
  }

  late final _$wayAtom = Atom(name: '_WaysStore.way', context: context);

  @override
  Way? get way {
    _$wayAtom.reportRead();
    return super.way;
  }

  @override
  set way(Way? value) {
    _$wayAtom.reportWrite(value, super.way, () {
      super.way = value;
    });
  }

  late final _$currentWayIdAtom =
      Atom(name: '_WaysStore.currentWayId', context: context);

  @override
  int get currentWayId {
    _$currentWayIdAtom.reportRead();
    return super.currentWayId;
  }

  @override
  set currentWayId(int value) {
    _$currentWayIdAtom.reportWrite(value, super.currentWayId, () {
      super.currentWayId = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_WaysStore.isLoading', context: context);

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

  late final _$_WaysStoreActionController =
      ActionController(name: '_WaysStore', context: context);

  @override
  void setWay(Way _way) {
    final _$actionInfo =
        _$_WaysStoreActionController.startAction(name: '_WaysStore.setWay');
    try {
      return super.setWay(_way);
    } finally {
      _$_WaysStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWays(List<Way> _ways) {
    final _$actionInfo =
        _$_WaysStoreActionController.startAction(name: '_WaysStore.setWays');
    try {
      return super.setWays(_ways);
    } finally {
      _$_WaysStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentWayId(int wayId) {
    final _$actionInfo = _$_WaysStoreActionController.startAction(
        name: '_WaysStore.setCurrentWayId');
    try {
      return super.setCurrentWayId(wayId);
    } finally {
      _$_WaysStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo =
        _$_WaysStoreActionController.startAction(name: '_WaysStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_WaysStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ways: ${ways},
way: ${way},
currentWayId: ${currentWayId},
isLoading: ${isLoading}
    ''';
  }
}
