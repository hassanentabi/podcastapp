import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomerText extends StatelessWidget {
  const CustomerText({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Text(
        title,
        style:  TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).hintColor ,
        ),
      ),
    );
  }
}
