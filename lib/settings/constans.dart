final List<String> locales = [
  'en',
  'uk',
  'hy',
  'ka',
  'el',
];

class AppSizes {
  static const double appBarHeight = 86;
  static const double defaulPadding = 30;
}

class ApiSettings {
  static const String baseUrl = "https://seaofwine.travel/";
  static const String apiForMap = baseUrl;
  static const String api = "${baseUrl}api/app";
}

class MoreInfoUrls {
  static const String siteUrl = ApiSettings.baseUrl;

  static const String agenciesUrl = "agencies";
  static const String eventsUrl = "events";
  static const String grapesUrl = "grapes";
  static const String blogUrl = "articles";
}

class MarkerIcons {
  static const String wineries = "assets/icons/locations/wineries.svg";
  static const String cafes = "assets/icons/locations/cafes.svg";
  static const String hotels = "assets/icons/locations/hotels.svg";
  static const String restaurants = "assets/icons/locations/restaurants.svg";
  static const String touristAttractions =
      "assets/icons/locations/tourist_attractions.svg";
}
