import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

import 'package:sea_of_wine_app/shared/buttons/map_button.dart';


class DraggableList extends StatefulWidget {
  final Widget Function(VoidCallback) builder;
  const DraggableList({Key? key, required this.builder}) : super(key: key);

  @override
  State<DraggableList> createState() => _DraggableListState();
}

class _DraggableListState extends State<DraggableList> {
  static const double minHeight = 100;

  double height = minHeight;
  bool isOpened = false;

  void close() {
    if (isOpened) {
      setState(() {
        height = minHeight;
        isOpened = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;

    void onDragEnd(details) {
      setState(
        () {
          height = height < maxHeight ? maxHeight : minHeight;
          isOpened = height >= maxHeight;
        },
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragEnd: onDragEnd,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 450),
          height: height,
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isOpened ? 0 : 30),
              topRight: Radius.circular(isOpened ? 0 : 30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaulPadding),
            child: Stack(
              children: [
                buildDecoratorLine(),
                buildContent(),
                buildMapButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildContent() {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.defaulPadding),
      child: widget.builder(close),
    );
  }

  Align buildMapButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: MapButton(
        isOpened: isOpened,
        onPressed: close,
      ),
    );
  }

  Padding buildDecoratorLine() {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.defaulPadding / 2),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 58,
          height: 2,
          decoration: BoxDecoration(
              color: AppColors.dark, borderRadius: BorderRadius.circular(1)),
        ),
      ),
    );
  }
}
