import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout(
        children: Scaffold(
            body: Center(
                child: Text(
      "Sea of wine / Routes",
      style: TextStyle(fontFamily: "NotoSansDisplay", fontSize: 24),
    ))));
  }
}
