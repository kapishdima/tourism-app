import 'package:get_it/get_it.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/map/store/filters_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/navigation/store/navigation_store.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';

final appStoresContainer = GetIt.instance;

void setup() {
  appStoresContainer.registerSingleton<CountriesStore>(CountriesStore());  
  appStoresContainer.registerSingleton<WaysStore>(WaysStore());
  appStoresContainer.registerSingleton<LocationsStore>(LocationsStore());
  appStoresContainer.registerSingleton<FiltersStore>(FiltersStore());
  appStoresContainer.registerSingleton<LocalesStore>(LocalesStore());
  appStoresContainer.registerSingleton<NavigationStore>(NavigationStore());
  appStoresContainer.registerSingleton<WineriesStore>(WineriesStore());
}
