import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/shared/layout.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(children: const Scaffold(
      body: Center(child: Text("Sea of wine / More Info", style: TextStyle(fontFamily: "NotoSansDisplay", fontSize: 24),))
    ));
  }
}