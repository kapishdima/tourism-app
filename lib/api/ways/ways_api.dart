import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_of_wine_app/modes/way/way.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class WaysApi {
  Future<List<Way>> getWays() async {
    final response =
        await http.get(Uri.parse("${ApiSettings.baseUrl}/ways?country_id=2"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load ways");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Way.fromJson(data)).toList();
  }
}
