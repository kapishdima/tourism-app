import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_of_wine_app/modules/countries/models/country.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class CountriesApi {
  Future<List<Country>> getCountries({required String locale}) async {
    final response =
        await http.get(Uri.parse("${ApiSettings.api}/$locale/countries"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load countries");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Country.fromJson(data)).toList();
  }
}
