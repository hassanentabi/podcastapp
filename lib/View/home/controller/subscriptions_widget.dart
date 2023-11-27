import 'package:flutter/material.dart';

import '../../../Model/Subscriptions.dart';

class SubscriptionsWidget extends StatelessWidget {
  const SubscriptionsWidget(
      {required this.itemIndex, required this.subscriptions});

  final int itemIndex;
  final Subscriptions subscriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.sizeOf(context).width * 0.09,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(subscriptions.image),
          Text(
            textAlign: TextAlign.left,
            subscriptions.title,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
