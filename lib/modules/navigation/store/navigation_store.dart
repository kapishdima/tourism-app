import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  String currentRoute = "/";

  @action
  void changeRoute(String route) {
    currentRoute = route;
  }

  bool isCurrentRoute(String route) {
    return currentRoute == route;
  }
}
