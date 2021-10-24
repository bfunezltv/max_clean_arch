import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashImageWidget extends StatelessWidget {
  const SplashImageWidget({required this.splashImageAsset, Key? key}) : super(key: key);

  final String splashImageAsset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      splashImageAsset,
      fit: BoxFit.contain,
      key: const Key('splash-image'),
    );
  }
}
