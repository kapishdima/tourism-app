import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/map/services/map_service.dart';
import 'package:sea_of_wine_app/modules/wineries/api/wineries_api.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery.dart';

part 'wineries_store.g.dart';

class WineriesStore = _WineriesStore with _$WineriesStore;

abstract class _WineriesStore with Store {
  WineriesApi wineriesApi = WineriesApi();

  @observable
  ObservableList<Winery> wineries = ObservableList();
  @observable
  int currentWineryId = 0;
  @observable
  Winery? winery;
  @observable
  bool isLoading = false;

  @action
  void setWineries(List<Winery> _wineries) {
    wineries = ObservableList.of(_wineries);
  }

  @action
  void setWinery(Winery _winery) {
    winery = _winery;
  }

  @action
  void setCurrentWineryId(int wineryId) {
    currentWineryId = wineryId;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void sortedByRating() {
    wineries.sort(
      (a, b) => a.rating.compareTo(b.rating),
    );
  }

  @action
  void sortedByAlphabet() {
    wineries.sort(
      (a, b) => a.name.compareTo(b.name),
    );
  }

  @action
  void sortedByGPS(Position currentLocation) {
    wineries.sort(
      (a, b) {
        LatLng currentLocationLatLng =
            LatLng(currentLocation.latitude, currentLocation.longitude);
        double aDistance = MapService.getDistanceBetweenPoints(
            currentLocationLatLng, LatLng(a.location.lat, a.location.lng));
        double bDistance = MapService.getDistanceBetweenPoints(
            currentLocationLatLng, LatLng(b.location.lat, b.location.lng));

        return aDistance.compareTo(bDistance);
      },
    );
  }

  void sort(String type) {
    if (type.isEmpty) {
      return;
    }

    if (type == "rating") {
      return sortedByRating();
    }

    if (type == "alphabet") {
      return sortedByAlphabet();
    }
  }

  void getWineryById(
      {required int country, required int id, required String locale}) async {
    setLoading(true);
    Winery fetchedWinery =
        await wineriesApi.getWinery(country: country, id: id, locale: locale);
    setWinery(fetchedWinery);
    setLoading(false);
  }

  void getWineries({required String locale, required int country}) async {
    setLoading(true);
    List<Winery> fetchedWineries =
        await wineriesApi.getWineries(locale: locale, country: country);
    setWineries(fetchedWineries);
    setLoading(false);
  }
}
