import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_of_wine_app/modes/location/location.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class LocationApi {
  Future<List<Location>> fetchLocations(Uri url) async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to load locations");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Location.fromJson(data)).toList();
  }

  // Future<List<Location>> getLocations() async {
  //   List<Location> locations =
  //       await fetchLocations(Uri.parse("${ApiSettings.baseUrl}/locations"));

  //   locations.sort(((a, b) => a.order.compareTo(b.order)));

  //   return locations;
  // }

  Future<List<Location>> getIncludedLocations(int wayId) async {
    List<Location> locations = await fetchLocations(
        Uri.parse("${ApiSettings.baseUrl}/locations?way_id=$wayId"));

    locations.sort(((a, b) => a.order.compareTo(b.order)));

    return locations;
  }

  Future<List<Location>> getNotIncludedLocations(int wayId) async {
    List<Location> locations = await fetchLocations(Uri.parse(
        "${ApiSettings.baseUrl}/locations?way_id=$wayId&type[]=winery"));

    return locations;
  }

  Future<List<Location>> getLocationsByFilter(
      int wayId, List<String> filters) async {
    List<Location> locations = await fetchLocations(Uri.parse(
        "${ApiSettings.baseUrl}/locations?way_id=$wayId&type[]=winery&${getFiltersUrl(filters)}"));

    return locations;
  }

  String getFiltersUrl(List<String> filters) {
    String filtersUrl = "";

    for (var filter in filters) {
      filtersUrl += "type[]=$filter&";
    }

    return filtersUrl;
  }
}
