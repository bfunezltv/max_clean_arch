import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'splash_image_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({required this.splashImageAsset, required this.onFirstFrame, Key? key}) : super(key: key);

  final String splashImageAsset;
  final VoidCallback onFirstFrame;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget.onFirstFrame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(64),
          child: SplashImageWidget(
            splashImageAsset: widget.splashImageAsset,
          ),
        ),
      ),
    );
  }
}
