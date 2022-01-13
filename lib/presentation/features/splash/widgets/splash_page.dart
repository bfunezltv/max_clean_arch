import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'splash_image_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({required this.splashImage, Key? key}) : super(key: key);

  final ImageProvider splashImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(64),
          child: SplashImageWidget(
            splashImage: splashImage,
          ),
        ),
      ),
    );
  }
}
