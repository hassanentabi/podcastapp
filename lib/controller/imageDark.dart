import 'package:flutter/material.dart';

class getImageDarkLight extends StatefulWidget {
  getImageDarkLight({Key? key, required this.Imagedark, required this.Imagelight})
      : super(key: key);

  final String Imagedark;
  final String Imagelight;

  @override
  _getImageDarkLightState createState() => _getImageDarkLightState();
}

class _getImageDarkLightState extends State<getImageDarkLight> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(getImagePath(context));
  }

  String getImagePath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    // Conditionally select the image based on the theme
    if (brightness == Brightness.light) {
      return widget.Imagelight;
    } else {
      return widget.Imagedark;
    }
  }
}
