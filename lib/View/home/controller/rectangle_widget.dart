import 'package:flutter/material.dart';
class Rectangle  extends StatelessWidget {
  const Rectangle ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26),
      child: Container(
        height: 166,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFF242327),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 28, top: 18),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' by: Live better',
                  style: TextStyle(color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        ' How to avoid burnout\n at work?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      ' 5 Dec',
                      style: TextStyle(color: Color(0xFFA7A6A5)),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 5, right: 5),
                      child: Image.asset('assets/Ellipse 190.png'),
                    ),
                    Text(
                      '1 hr 15 min',
                      style: TextStyle(color: Color(0xFFA7A6A5)),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
