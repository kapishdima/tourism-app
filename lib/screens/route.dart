import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/disqus/ui/disqus.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/locations_list.dart';
import 'package:sea_of_wine_app/modules/map/ui/map.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/html_text.dart';
import 'package:sea_of_wine_app/shared/image_slider.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/skeleton_loading_screen.dart';

class RouteScreenConfiguration {
  final String name;
  final String text;
  final String image;
  final List<String> gallery;

  RouteScreenConfiguration(
      {required this.name,
      required this.text,
      required this.image,
      required this.gallery});
}

class RouteScreen extends StatefulWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final WaysStore wayStore = appStoresContainer.get<WaysStore>();
  final LocalesStore localesStore = appStoresContainer.get<LocalesStore>();

  @override
  void initState() {
    super.initState();

    reaction<String>(
      (_) => localesStore.currentLocale,
      (locale) => wayStore.getWayById(
          country: countriesStore.currentCountry,
          id: wayStore.currentWayId,
          locale: locale),
    );

    wayStore.getWayById(
        country: countriesStore.currentCountry,
        id: wayStore.currentWayId,
        locale: localesStore.currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (wayStore.isLoading) {
        return RouteScreenView.loading();
      }
      return RouteScreenView.loaded(
        RouteScreenConfiguration(
          name: wayStore.way!.name,
          text: wayStore.way!.text,
          image: wayStore.way!.image.url,
          gallery: wayStore.way!.gallery.map((image) => image.url).toList(),
        ),
      );
    });
  }
}

abstract class RouteScreenView extends StatelessWidget {
  const RouteScreenView({Key? key}) : super(key: key);

  factory RouteScreenView.loading() => const RouteScreenViewLoading();
  factory RouteScreenView.loaded(RouteScreenConfiguration configuration) =>
      RouteScreenViewLoaded(configuration: configuration);
}

class RouteScreenViewLoading extends RouteScreenView {
  const RouteScreenViewLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SkeletonLoadingScreen();
  }
}

class RouteScreenViewLoaded extends RouteScreenView {
  final RouteScreenConfiguration configuration;

  final WaysStore wayStore = appStoresContainer.get<WaysStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  RouteScreenViewLoaded({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      children: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeadImage(),
            const SizedBox(height: AppSizes.defaulPadding),
            GridContainer(
              child: HtmlText(
                text: configuration.text,
                style: const TextStyle(color: AppColors.superGray),
              ),
            ),
            const SizedBox(height: AppSizes.defaulPadding * 2),
            configuration.gallery.isNotEmpty
                ? Container(
                    height: 325,
                    padding: const EdgeInsets.only(
                        bottom: AppSizes.defaulPadding * 2),
                    child: ImageSlider(images: configuration.gallery),
                  )
                : Container(),
            const MapWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppSizes.defaulPadding,
                  bottom: AppSizes.defaulPadding * 2),
              child: LocationsList(),
            ),
            DisqusWidget()
          ],
        ),
      ),
    );
  }

  SizedBox buildHeadImage() {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          Positioned.fill(
            child: configuration.image.isNotEmpty
                ? FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/thumb_placeholder.png"),
                    image: NetworkImage(configuration.image),
                    fit: BoxFit.cover,
                  )
                : Image.asset("assets/images/thumb_placeholder.png"),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color.fromRGBO(111, 111, 111, 0),
                    Color.fromRGBO(0, 0, 0, 0.48),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 60),
              child: Text(
                configuration.name,
                style:
                    AppTextsStyles.headline2.copyWith(color: AppColors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
