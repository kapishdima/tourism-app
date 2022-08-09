import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/ways/api/ways_api.dart';
import 'package:sea_of_wine_app/modules/ways/model/way.dart';

part 'ways_store.g.dart';

class WaysStore = _WaysStore with _$WaysStore;

abstract class _WaysStore with Store {
  WaysApi waysApi = WaysApi();

  @observable
  ObservableList ways = ObservableList();
  @observable
  Way? way;

  @observable
  int currentWayId = -1;
  @observable
  bool isLoading = true;

  @action
  void setWay(Way _way) {
    way = _way;
  }

  @action
  void setWays(List<Way> _ways) {
    ways = ObservableList.of(_ways);
  }

  @action
  void setCurrentWayId(int wayId) {
    currentWayId = wayId;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  bool isSelected(int id) {
    return currentWayId == id;
  }

  void getWayById(
      {required int country, required int id, required String locale}) async {
    setLoading(true);
    Way fetchedWay =
        await waysApi.getWay(country: country, id: id, locale: locale);
    setWay(fetchedWay);
    setLoading(false);
  }

  void getWays({required String locale, required int country}) async {
    setLoading(true);
    List<Way> fetchedWays =
        await waysApi.getWays(locale: locale, country: country);
    setWays(fetchedWays);
    if (fetchedWays.isNotEmpty) {
      setCurrentWayId(fetchedWays.first.id);
    }
    setLoading(false);
  }
}
