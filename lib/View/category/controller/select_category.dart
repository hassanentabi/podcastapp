import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}



class _SelectCategoryState extends State<SelectCategory> {

  List<String> images = [
  'assets/Politics.png',
  'assets/relationship.png',
  'assets/education.png',
  'assets/language.png',
  'assets/art.png',
  'assets/humor.png',
  // Add more images here
  ];
  List<bool> selectedItems = List.generate(20, (index) => false);
  @override
  Widget build(BuildContext context) {

    List<String> imageNames = [];

    for (String imagePath in images) {
      List<String> pathComponents = imagePath.split('/');
      if (pathComponents.isNotEmpty) {
        String imageNameWithExtension = pathComponents.last;
        String imageName = imageNameWithExtension.split('.').first;
        imageNames.add(imageName);
      }
    }

    Container selectedIcon = Container(
        color: Theme.of(context).dialogBackgroundColor,
        child:  Icon(
          Icons.check,
          size: 24,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ));

    return SingleChildScrollView(
      child: Wrap(
        children: List.generate(images.length, (index) {
          return GestureDetector(
            onTap: () {
              // Handle item click here
              setState(() {
                selectedItems[index] = !selectedItems[index];
              });
            },
            child: Padding(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: selectedItems[index]
                          //       ? Colors.blue
                          //       : Colors.transparent,
                          //   width: 2.0,
                          // ),
                          borderRadius:
                          BorderRadius.circular(35.0),
                        ),
                        child: Image.asset(images[index]),
                      ),
                      if (selectedItems[
                      index]) // Show the checkmark icon if the item is selected
                        Positioned(
                          top: 0,
                          right: 0,
                          child: selectedIcon,
                        ),
                    ],
                  ),
                  Text(
                    imageNames[index],
                    style:  TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                      fontFamily: 'NotoSans',
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
