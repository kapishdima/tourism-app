import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class AppLocalization {
  late final Locale _locale;

  AppLocalization(this._locale);

  static LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, String> _localizedValues;

  Future loadLocales() async {
    String jsonStringValues =
        await rootBundle.loadString("assets/lang/${_locale.languageCode}.json");

    Map<String, dynamic> mappedValues = json.decode(jsonStringValues);

    _localizedValues = mappedValues.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
  }

  String t(String key) {
    return _localizedValues[key] ?? "null";
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();
  

  @override
  bool isSupported(Locale locale) {
    return locales.contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.loadLocales();
    return appLocalization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
