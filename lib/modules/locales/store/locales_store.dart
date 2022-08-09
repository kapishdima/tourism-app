import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/locales/api/locales_api.dart';
import 'package:sea_of_wine_app/modules/locales/model/locale.dart';

part 'locales_store.g.dart';

class LocalesStore = _LocalesStore with _$LocalesStore;

abstract class _LocalesStore with Store {
  LocalesApi localesApi = LocalesApi();

  @observable
  String currentLocale = "";
  @observable
  ObservableList<Locale> locales = ObservableList();
  @observable
  bool isLoading = false;

  @action
  setLocales(List<Locale> _locales) {
    locales = ObservableList.of(_locales);
  }

  @action
  setCurrentLocale(String locale) {
    currentLocale = locale;
  }

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @computed
  String get generalLocale {
    return "en";
  }

  Future<void> getLocales() async {
    setLoading(true);
    List<Locale> fetchedLocales = await localesApi.getLocales();
    setLocales(fetchedLocales);
    if (currentLocale.isEmpty) {
      setCurrentLocale(fetchedLocales.first.code);
    }
    setLoading(false);
  }
}
