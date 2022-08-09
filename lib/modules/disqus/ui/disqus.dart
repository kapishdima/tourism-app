import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DisqusWidget extends StatelessWidget {
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  DisqusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ConstrainedBox(
    //   constraints: const BoxConstraints(maxHeight: 500),
    //   child: GridContainer(
    //     child: WebView(
    //       initialUrl: "${ApiSettings.baseUrl}disqus?identifier=gavno",
    //       gestureRecognizers: gestureRecognizers,
    //       javascriptMode: JavascriptMode.unrestricted,
    //     ),
    //   ),
    // );

    return Container();
  }
}
