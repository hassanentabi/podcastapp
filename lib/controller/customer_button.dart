import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomerButtom extends StatelessWidget {
  const CustomerButtom({required this.title, required this.onPressed,  this.color = Buttoncolor , this.textColor = Colors.white});

  final String title;
  final void Function() onPressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 58, right: 58),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          //backgroundColor: Buttoncolor,
          backgroundColor: color,
          minimumSize: Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
