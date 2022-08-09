import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sea_of_wine_app/modules/wineries/models/winery.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class WineriesApi {
  Future<List<Winery>> getWineries({required String locale, required int country}) async {
    final response = await http
        .get(Uri.parse("${ApiSettings.api}/$locale/countries/$country/wineries"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load wineries");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];
    return responseJson.map((data) => Winery.fromJson(data)).toList();
  }

  Future<Winery> getWinery(
      {required int country, required int id, required String locale}) async {
    final response =
        await http.get(Uri.parse("${ApiSettings.api}/$locale/countries/$country/wineries/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load wineries");
    }

    final dynamic responseJson = jsonDecode(response.body)["data"];

    return Winery.fromJson(responseJson);
  }
}
