import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_of_wine_app/modules/tags/model/tag.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class TagsApi {
  Future<List<Tag>> getTags({required int country, required String locale}) async {
    final response =
        await http.get(Uri.parse("${ApiSettings.api}/$locale/countries/$country/tags"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load tags");
    }

    final List<dynamic> responseJson = jsonDecode(response.body)["data"];

    return responseJson.map((data) => Tag.fromJson(data)).toList();
  }
}
