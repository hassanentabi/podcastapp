import 'package:flutter/material.dart';
import 'package:podcastapp/View/home/controller/reccomended_widget.dart';
import 'package:podcastapp/View/home/controller/rectangle_widget.dart';
import 'package:podcastapp/View/home/controller/subscriptions_widget.dart';

import '../../../Model/Subscriptions.dart';
import '../../../Model/product.dart';
import '../../../Model/reccomended.dart';
import '../../../controller/card_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.length,
                itemBuilder: (context, index) => CardWidget(
                  itemIndex: index,
                  product: product[index],
                ),
              ),
            ),
            Rectangle(),
            const Padding(
              padding: EdgeInsets.only(left: 26, right: 26, top: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your subscriptioons',
                  ),
                  Text(
                    'See all',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 320),
              child: Column(
                children: [Text('_')],
              ),
            ),
            SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: subscriptions.length,
                        itemBuilder: (context, index) => SubscriptionsWidget(
                            itemIndex: index,
                            subscriptions: subscriptions[index]),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 265, top: 38),
              child: Text(
                'Reccomended',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reccomended.length,
                      itemBuilder: (context, index) => ReccomendedWidget(
                        itemIndex: index,
                        reccomended: reccomended[index],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
