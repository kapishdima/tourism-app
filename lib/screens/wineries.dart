import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';

class WineriesScreen extends StatelessWidget {
  const WineriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(children: const Scaffold(
      body: Center(child: Text("Sea of wine / Wineries", style: TextStyle(fontFamily: "NotoSansDisplay", fontSize: 24),))
    ));
  }
}