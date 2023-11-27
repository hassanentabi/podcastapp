import 'package:flutter/material.dart';

import '../../../Model/reccomended.dart';

class ReccomendedWidget extends StatelessWidget {
  const ReccomendedWidget({required this.itemIndex, required this.reccomended});

  final int itemIndex;
  final Reccomended reccomended;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 140,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFCEEDFF)),
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 20),
                      child: Image.asset(reccomended.imge),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        reccomended.title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 58, bottom: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Image.asset(
                              'assets/Ellipse 190.png',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            reccomended.suptitle,
                            style: TextStyle(color: Color(0xFFA7A6A5)),
                          ),
                        ])),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('12 K'),
                      Icon(Icons.favorite_outlined),
                      SizedBox(
                        width: 40,
                      ),
                      Icon(Icons.usb)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
