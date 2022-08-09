import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/countries/api/countries_api.dart';
import 'package:sea_of_wine_app/modules/countries/models/country.dart';
import 'package:sea_of_wine_app/modules/countries/models/country_region.dart';

part 'countries_store.g.dart';

class CountriesStore = _CountriesStore with _$CountriesStore;

abstract class _CountriesStore with Store {
  CountriesApi countriesApi = CountriesApi();

  @observable
  ObservableList<CountryRegion> regions = ObservableList();

  @observable
  ObservableList<Country> countries = ObservableList();
  @observable
  int currentCountry = 0;
  @observable
  bool isLoading = false;

  ObservableFuture<List<Country>>? waysFuture;

  @action
  void setCountries(List<Country> _countries) {
    countries = ObservableList.of(_countries);
  }

  @action
  void setCurrentCountry(int countryId) {
    currentCountry = countryId;
  }

  @action
  void setRegions(List<CountryRegion> _regions) {
    regions = ObservableList.of(_regions);
  }

  @computed
  String get currentName {
    return getCountryById(currentCountry).name;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  Country getCountryById(int id) {
    return countries.firstWhere((country) => country.id == id,
        orElse: () => countries.first);
  }

  void getCountries({required String locale}) async {
    setLoading(true);
    List<Country> fetchedCountries =
        await countriesApi.getCountries(locale: locale);
    setCountries(fetchedCountries);
    setLoading(false);
  }

  void getRegions() {
    if (currentCountry == 0 || countries.isEmpty) {
      return;
    }

    Country country = getCountryById(currentCountry);

    setRegions(country.regions);
  }
}
