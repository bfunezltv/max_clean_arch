import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashImageWidget extends StatelessWidget {
  const SplashImageWidget({required this.splashImage, Key? key}) : super(key: key);

  final ImageProvider splashImage;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: splashImage,
      fit: BoxFit.contain,
      key: const Key('splash-image'),
    );
  }
}
