import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import "package:collection/collection.dart";

class LocationApi {
  Future<List<Location>> fetchLocations(Uri url) async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to load locations");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Location.fromJson(data)).toList();
  }

  Future<List<Location>> getIncludedLocations(int wayId) async {
    List<Location> locations = await fetchLocations(
        Uri.parse("${ApiSettings.apiForMap}locations?way_id=$wayId"));

    locations.sort(((a, b) => a.order.compareTo(b.order)));

    return locations.where((location) => location.include).toList();
  }

  Future<List<Location>> getNotIncludedLocations(int wayId) async {
    List<Location> locations = await fetchLocations(
        Uri.parse("${ApiSettings.apiForMap}locations?way_id=$wayId"));

    return locations.where((location) => !location.include).toList();
  }

  Future<List<Location>> getLocationsByFilter(
      {required int wayId,
      List<String>? filters,
      List<String>? tags,
      List<String>? regions}) async {
    String urlWithFilters =
        getFiltersUrl(filters: filters, tags: tags, regions: regions);

    List<Location> locations = await fetchLocations(
      Uri.parse(
          "${ApiSettings.apiForMap}locations?way_id=$wayId&$urlWithFilters"),
    );

    return locations.where((location) => !location.include).toList();
  }

  Future<List<Location>> getBlackSeaLocations() async {
    List<Location> locations = await fetchLocations(
        Uri.parse("${ApiSettings.apiForMap}locations?way_id=black-sea"));
    // List<Location> includedLocations =
    //     locations.where((location) => location.include).toList();

    return locations;
  }

  String getFiltersUrl(
      {List<String>? filters, List<String>? tags, List<String>? regions}) {
    String filtersUrl = "";

    if (filters != null) {
      for (var filter in filters) {
        filtersUrl += "type[]=$filter&";
      }
    }

    if (regions != null) {
      for (var region in regions) {
        filtersUrl += "region[]=$region&";
      }
    }

    if (tags != null) {
      for (var tag in tags) {
        filtersUrl += "tag[]=$tag&";
      }
    }

    return filtersUrl;
  }
}
