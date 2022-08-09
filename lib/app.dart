import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

import 'package:sea_of_wine_app/settings/router.dart';
import 'package:sea_of_wine_app/settings/theme.dart';
import 'package:sea_of_wine_app/setup.dart';

class App extends StatelessWidget {
  final LocalesStore localesStore = appStoresContainer.get<LocalesStore>();

  App({Key? key}) : super(key: key);

  final List<Locale> supportedLocales = locales
      .map(
        (locale) => Locale(locale))
      .toList();

  final List<LocalizationsDelegate> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalization.delegate
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Sea of Wine',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.ligthTheme,
          initialRoute: AppRouter.initialRoute,
          routes: AppRouter.routes,
          locale: Locale(localesStore.currentLocale.isEmpty ? "en" : localesStore.currentLocale),
          supportedLocales: supportedLocales,
          localeResolutionCallback: localeResolution,
          localizationsDelegates: localizationsDelegates,
        );
      }
    );
  }

  Locale? localeResolution(deviceLocale, supportedLocales) {
    for (var locale in supportedLocales) {
      if (locale.languageCode == deviceLocale!.languageCode &&
          locale.countryCode == deviceLocale.countryCode) {
        return deviceLocale;
      }
    }
    return supportedLocales.first;
  }
}
