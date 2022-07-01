import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_of_wine_app/api/ways/ways_api.dart';
import 'package:sea_of_wine_app/modes/way/way.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';
import 'package:sea_of_wine_app/shared/layout.dart';
import 'package:sea_of_wine_app/shared/map/map.dart';
import 'package:sea_of_wine_app/shared/page_headline.dart';
import 'package:sea_of_wine_app/shared/ways_list.dart';
import 'package:sea_of_wine_app/store/filters_store.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<Way>? _ways;
  int? _selectedWay;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });

    getWays();
  }

  void getWays() async {
    List<Way> ways = await WaysApi().getWays();

    setState(() {
      _ways = ways;
      _selectedWay = ways[1].id;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FiltersStore>(create: (_) => FiltersStore()),
      ],
      child: Layout(
          children: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(children: [
          const Padding(padding: EdgeInsets.all(30), child: PageHeadline()),
          SizedBox(
            height: 525,
            child: _selectedWay == null
                ? null
                : MapWidget(
                    wayId: _selectedWay!,
                  ),
          ),
          _isLoading || _ways == null
              ? const Center(
                  child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.dark,
                  ),
                ))
              : WayList(ways: _ways!),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "However, the main leaders are the western and southern regions. The most popular regions are Danube Bessarabia (Odessa region) and Transcarpathia (Zakarpattia region). There are also Kherson and Mykolayiv regions which are located in the Black Sea region. There are wineries, whose histories go back to the nineteenth century, as well as new private producers trying to conquer the market.",
                    style: AppTheme.ligthTheme.textTheme.bodyText1!
                        .copyWith(color: AppColors.superGray),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Thus, despite their slow growth, the wineries here have such charm and quality that they are definitely worth discovering. The southern Ukrainian climate is quite mild, thus it fosters wine production in its numerous vineyards.",
                      style: AppTheme.ligthTheme.textTheme.bodyText1!
                          .copyWith(color: AppColors.superGray),
                    ),
                  )
                ],
              ))
        ]),
      )),
    );
  }
}
