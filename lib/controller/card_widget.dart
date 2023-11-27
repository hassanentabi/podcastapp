import 'package:flutter/material.dart';
import 'package:podcastapp/Model/product.dart';
class CardWidget extends StatelessWidget {
  const CardWidget({required this.itemIndex, required this.product});
final int itemIndex;
final Product product;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 140,
            width: 299,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF2EFED)),
            child: Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Image.asset(product.image),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, bottom: 25),
                        child: Text(
                          'How to hack the\n education system?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(children: [
                      Text('6 Dec',style: TextStyle(color: Color(0xFFA7A6A5)),),
                      Padding(
                        padding: const EdgeInsets.only(left:5,right: 5),
                        child: Image.asset('assets/Ellipse 190.png'),
                      ),
                      Text('1 hr 15 min',style: TextStyle(color: Color(0xFFA7A6A5)),), Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('25',style: TextStyle(color: Color(0xFFA7A6A5)),),
                      ),
                      Icon(Icons.favorite_outlined,color: Color(0xFFA7A6A5),)
                    ],),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  }
}
