import 'package:flutter/material.dart';
import 'package:podcastapp/View/home/home_page.dart';

import '../../../controller/customer_button.dart';
import '../../../controller/customer_text.dart';
import '../../../controller/title_text.dart';

import '../controller/select_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}




class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
         // color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
             horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical:  MediaQuery.of(context).size.width * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.07,),
                  child: TitleText(title: 'What do you like ?'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: CustomerText(title: 'Top to select'),
                ),
                Expanded(
                  flex: 5,
                  child: SelectCategory(),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.07),
                    child: Center(
                      child: CustomerButtom(
                        title: "Start",
                        onPressed: () {
                          //  Navigate to the HomePage
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
