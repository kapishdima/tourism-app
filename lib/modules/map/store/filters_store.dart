import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/tags/api/tags_api.dart';
import 'package:sea_of_wine_app/modules/tags/model/tag.dart';

part 'filters_store.g.dart';

class FiltersStore = _FiltersStore with _$FiltersStore;

abstract class _FiltersStore with Store {
  TagsApi tagsApi = TagsApi();

  @observable
  ObservableList<Tag> tags = ObservableList();
  @observable
  bool isTagsLoading = false;

  @observable
  ObservableList<String> selectedFilters = ObservableList<String>();
  @observable
  ObservableList<String> selectedTags = ObservableList<String>();
  @observable
  ObservableList<String> selectedRegions = ObservableList<String>();

  @action
  void setFilters(List<String> filtres) {
    selectedFilters = ObservableList.of(filtres);
  }

  @action
  void setTags(List<Tag> _tags) {
    tags = ObservableList.of(_tags);
  }

  @action
  void setTagsLoading(bool value) {
    isTagsLoading = value;
  }

  @action
  void changeFilter(String filter) {
    if (isSelected(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  @action
  void changeTag(String tag) {
    if (isTagSelected(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }

  @action
  void changeRegions(String region) {
    if (isRegionSelected(region)) {
      selectedRegions.remove(region);
    } else {
      selectedRegions.add(region);
    }
  }

  void getTags({required int country, required String locale}) async {
    setTagsLoading(true);
    List<Tag> fetchedTags =
        await tagsApi.getTags(country: country, locale: locale);
    setTags(fetchedTags);
    setTagsLoading(false);
  }

  bool isRegionSelected(String region) {
    return selectedRegions.contains(region);
  }

  bool isTagSelected(String tag) {
    return selectedTags.contains(tag);
  }

  bool isSelected(String filter) {
    return selectedFilters.contains(filter);
  }
}
