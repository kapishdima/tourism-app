import 'package:mobx/mobx.dart';

part 'filters_store.g.dart';

class FiltersStore = _FiltersStore with _$FiltersStore;

abstract class _FiltersStore with Store {
  @observable
  ObservableList<String> selectedFilters = ObservableList<String>();

  @action
  void changeFilter(String filter) {
    if (isSelected(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  bool isSelected(String filter) {
    return selectedFilters.contains(filter);
  }
}
