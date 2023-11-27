import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        //right: MediaQuery.of(context).size.width * 0.65,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
