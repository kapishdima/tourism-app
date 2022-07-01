// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MarkersStore on _MarkersStore, Store {
  late final _$markersAtom =
      Atom(name: '_MarkersStore.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$_MarkersStoreActionController =
      ActionController(name: '_MarkersStore', context: context);

  @override
  dynamic setMarkers(Set<Marker> _markers) {
    final _$actionInfo = _$_MarkersStoreActionController.startAction(
        name: '_MarkersStore.setMarkers');
    try {
      return super.setMarkers(_markers);
    } finally {
      _$_MarkersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers}
    ''';
  }
}
