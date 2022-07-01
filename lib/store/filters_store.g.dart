// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltersStore on _FiltersStore, Store {
  late final _$selectedFiltersAtom =
      Atom(name: '_FiltersStore.selectedFilters', context: context);

  @override
  ObservableList<String> get selectedFilters {
    _$selectedFiltersAtom.reportRead();
    return super.selectedFilters;
  }

  @override
  set selectedFilters(ObservableList<String> value) {
    _$selectedFiltersAtom.reportWrite(value, super.selectedFilters, () {
      super.selectedFilters = value;
    });
  }

  late final _$_FiltersStoreActionController =
      ActionController(name: '_FiltersStore', context: context);

  @override
  void changeFilter(String filter) {
    final _$actionInfo = _$_FiltersStoreActionController.startAction(
        name: '_FiltersStore.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_FiltersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedFilters: ${selectedFilters}
    ''';
  }
}
