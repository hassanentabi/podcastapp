import 'package:flutter/material.dart';

import '../../constants.dart';
class SocialButton extends StatelessWidget {
   SocialButton({required this.title,required this.image, required this.onPressed});

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide.none,
            ),
            backgroundColor:Theme.of(context).inputDecorationTheme.hintStyle?.color,
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
                width: 50,
                height: 50,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,

    ),
              ),
            ],
          ),
    );
  }
}
