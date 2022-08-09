import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_of_wine_app/modules/locales/model/locale.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class LocalesApi {
  Future<List<Locale>> getLocales() async {
    final response =
        await http.get(Uri.parse("${ApiSettings.api}/locales"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load locales");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Locale.fromJson(data)).toList();
  }
}
