import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sea_of_wine_app/modules/ways/model/way.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class WaysApi {
  Future<List<Way>> getWays({required String locale, required int country}) async {
    final response =
        await http.get(Uri.parse("${ApiSettings.api}/$locale/countries/$country/ways/"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load ways");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Way.fromJson(data)).toList();
  }

  Future<Way> getWay({required int country, required int id, required String locale}) async {
    final response =
        await http.get(Uri.parse("${ApiSettings.api}/$locale/countries/$country/ways/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load way");
    }

    final dynamic responseJson = jsonDecode(response.body)["data"];

    return Way.fromJson(responseJson);
  }
}
