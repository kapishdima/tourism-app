import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/api/locations/locations_api.dart';
import 'package:sea_of_wine_app/modes/location/location.dart';

part 'locations_store.g.dart';

class LocationsStore = _LocationsStore with _$LocationsStore;

abstract class _LocationsStore with Store {
  LocationApi locationsClient = LocationApi();

  @observable
  Location? currentLocation;

  @observable
  ObservableFuture<List<Location>>? inlucdedLocationFuture;
  @observable
  ObservableFuture<List<Location>>? notInlucdedLocationFuture;

  @action
  Future fetchIncludedLocations(int wayId) => inlucdedLocationFuture =
      ObservableFuture(locationsClient.getIncludedLocations(wayId));

  @action
  Future fetchNotIncludedLocations(int wayId) => notInlucdedLocationFuture =
      ObservableFuture(locationsClient.getNotIncludedLocations(wayId));

  @action
  Future filterNotIncludedLocations(int wayId, List<String> filters) =>
      notInlucdedLocationFuture = ObservableFuture(
          locationsClient.getLocationsByFilter(wayId, filters));

  @action
  void setCurrentLocation(Location location) {
    currentLocation = location;
  }

  void getIncludedLocations(int wayId) {
    fetchIncludedLocations(wayId);
  }

  void getNotIncludedLocations(int wayId) {
    fetchNotIncludedLocations(wayId);
  }

  void filterLocations(int wayId, List<String> filters) {
    filterNotIncludedLocations(wayId, filters);
  }
}
