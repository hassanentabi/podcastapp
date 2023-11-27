import 'package:flutter/material.dart';
import 'package:podcastapp/View/home/controller/home_body.dart';

class BtnNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
   BtnNavigationBar({Key? key, required this.selectedIndex, required this.onItemTapped}) : super(key: key);

  @override
  _BtnNavigationBarState createState() => _BtnNavigationBarState();
}

class _BtnNavigationBarState extends State<BtnNavigationBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Home',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Grid',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Camera',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Settings',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_outlined,
              ),
              label: '',
              activeIcon: Icon(Icons.grid_view_sharp)),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy_sharp),
            activeIcon: Icon(
              Icons.file_copy,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Theme.of(context).hintColor ,
        unselectedItemColor: Theme.of(context).hintColor ,
        iconSize: 30,
        onTap: widget.onItemTapped,
      );

  }
}
