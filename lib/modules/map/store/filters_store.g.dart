// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltersStore on _FiltersStore, Store {
  late final _$tagsAtom = Atom(name: '_FiltersStore.tags', context: context);

  @override
  ObservableList<Tag> get tags {
    _$tagsAtom.reportRead();
    return super.tags;
  }

  @override
  set tags(ObservableList<Tag> value) {
    _$tagsAtom.reportWrite(value, super.tags, () {
      super.tags = value;
    });
  }

  late final _$isTagsLoadingAtom =
      Atom(name: '_FiltersStore.isTagsLoading', context: context);

  @override
  bool get isTagsLoading {
    _$isTagsLoadingAtom.reportRead();
    return super.isTagsLoading;
  }

  @override
  set isTagsLoading(bool value) {
    _$isTagsLoadingAtom.reportWrite(value, super.isTagsLoading, () {
      super.isTagsLoading = value;
    });
  }

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

  late final _$selectedTagsAtom =
      Atom(name: '_FiltersStore.selectedTags', context: context);

  @override
  ObservableList<String> get selectedTags {
    _$selectedTagsAtom.reportRead();
    return super.selectedTags;
  }

  @override
  set selectedTags(ObservableList<String> value) {
    _$selectedTagsAtom.reportWrite(value, super.selectedTags, () {
      super.selectedTags = value;
    });
  }

  late final _$selectedRegionsAtom =
      Atom(name: '_FiltersStore.selectedRegions', context: context);

  @override
  ObservableList<String> get selectedRegions {
    _$selectedRegionsAtom.reportRead();
    return super.selectedRegions;
  }

  @override
  set selectedRegions(ObservableList<String> value) {
    _$selectedRegionsAtom.reportWrite(value, super.selectedRegions, () {
      super.selectedRegions = value;
    });
  }

  late final _$_FiltersStoreActionController =
      ActionController(name: '_FiltersStore', context: context);

  @override
  void setFilters(List<String> filtres) {
    final _$actionInfo = _$_FiltersStoreActionController.startAction(
        name: '_FiltersStore.setFilters');
    try {
      return super.setFilters(filtres);
    } finally {
      _$_FiltersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTags(List<Tag> _tags) {
    final _$actionInfo = _$_FiltersStoreActionController.startAction(
        name: '_FiltersStore.setTags');
    try {
      return super.setTags(_tags);
    } finally {
      _$_FiltersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTagsLoading(bool value) {
    final _$actionInfo = _$_FiltersStoreActionController.startAction(
        name: '_FiltersStore.setTagsLoading');
    try {
      return super.setTagsLoading(value);
    } finally {
      _$_FiltersStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void changeTag(String tag) {
    final _$actionInfo = _$_FiltersStoreActionController.startAction(
        name: '_FiltersStore.changeTag');
    try {
      return super.changeTag(tag);
    } finally {
      _$_FiltersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRegions(String region) {
    final _$actionInfo = _$_FiltersStoreActionController.startAction(
        name: '_FiltersStore.changeRegions');
    try {
      return super.changeRegions(region);
    } finally {
      _$_FiltersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tags: ${tags},
isTagsLoading: ${isTagsLoading},
selectedFilters: ${selectedFilters},
selectedTags: ${selectedTags},
selectedRegions: ${selectedRegions}
    ''';
  }
}
