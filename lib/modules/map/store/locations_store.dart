import 'package:mobx/mobx.dart';
import 'package:collection/collection.dart';

import 'package:sea_of_wine_app/modules/map/api/locations/locations_api.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';

part 'locations_store.g.dart';

class LocationsStore = _LocationsStore with _$LocationsStore;

abstract class _LocationsStore with Store {
  LocationApi locationsClient = LocationApi();

  @observable
  bool isLoading = false;

  @observable
  Location? currentLocation;

  @observable
  Location? selectedLocation;

  @observable
  ObservableMap<String, List<Location>> blackSeaLocations = ObservableMap();

  @observable
  ObservableList<Location> includedLocations = ObservableList();

  @observable
  ObservableList<Location> notIncludedLocations = ObservableList();

  @action
  void setCurrentLocation(Location? location) {
    currentLocation = location;
  }

  @action
  void setSelectedLocation(Location? location) {
    selectedLocation = location;
  }

  @action
  void setLoading(bool loading) {
    isLoading = loading;
  }

  @action
  void setIncludedLocations(List<Location> _includedLocations) {
    includedLocations = ObservableList.of(_includedLocations);
  }

  @action
  void setNotIncludedLocations(List<Location> _notIncludedLocations) {
    notIncludedLocations = ObservableList.of(_notIncludedLocations);
  }

  @action
  void setBlackSeaLocation(Map<String, List<Location>> locations) {
    blackSeaLocations = ObservableMap.of(locations);
  }

  @action
  void clearCurrentLocation() {
    currentLocation = null;
  }

  @action
  void clearSelectedLocation() {
    selectedLocation = null;
  }

  @computed
  Location get start {
    return includedLocations.first;
  }

  @computed
  Location get finish {
    return includedLocations.last;
  }

  @computed
  List<Location> get waypoints {
    if (includedLocations.length <= 2) {
      return [];
    }

    return includedLocations.getRange(1, includedLocations.length).toList();
  }

  void getBlackSeaLocations() async {
    setLoading(true);

    List<Location> locations = await locationsClient.getBlackSeaLocations();
    Map<String, List<Location>> groupedLocations =
        groupBy(locations, (Location location) => location.countryName);

    List<Location> _includedLocations =
        locations.where((location) => location.include).toList();
    List<Location> _notIncludedLocations =
        locations.where((location) => !location.include).toList();

    setBlackSeaLocation(groupedLocations);
    setIncludedLocations(_includedLocations);
    setNotIncludedLocations(_notIncludedLocations);
    setLoading(false);
  }

  void getLocations(int wayId) async {
    setLoading(true);

    List<Location> _includedLocations =
        await locationsClient.getIncludedLocations(wayId);
    List<Location> _notIncludedLocations =
        await locationsClient.getNotIncludedLocations(wayId);

    setIncludedLocations(_includedLocations);
    setNotIncludedLocations(_notIncludedLocations);

    setLoading(false);
  }

  void filterLocations(
      {required int wayId,
      List<String>? filters,
      List<String>? tags,
      List<String>? regions}) async {
    setLoading(true);

    List<Location> locations = await locationsClient.getLocationsByFilter(
      wayId: wayId,
      filters: filters,
      tags: tags,
      regions: regions,
    );

    setLoading(false);
    setNotIncludedLocations(locations);
  }

  List<Location> withoutDublicates(
      List<Location> aLocations, List<Location> bLocations) {
    return aLocations.where((location) {
      Location? _location = bLocations.firstWhereOrNull((element) {
        return "${element.lat}${element.lat}" !=
            "${location.lat}${location.lat}";
      });
      return location.id == _location?.id;
    }).toList();
  }
}
