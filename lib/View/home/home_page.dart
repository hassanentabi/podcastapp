import 'package:flutter/material.dart';
import '../setting/Setting.dart';
import '../setting/api_test.dart';
import '../setting/api_test2.dart';
import 'controller/bottomNavigationBar.dart';
import 'controller/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // index page
  int _selectedIndex = 0;

  // screen list to show page
  final List<Widget> screens = [
    HomeBody(),
    ApiTest2Page(),
    ApiTestPage(),
    LogoutScreen(),
  ];


  // select tap when pres icon
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // to to make favorite icon
  bool isFavorite = false;

  // toggle icon favorite or not
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  // Future<String> getName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('user'));
  //    return prefs.getString('user') ?? "";
  // }

  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.02,
          ),
          child: Text(
            'Hello,  $userName !',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width * 0.02,
            ),
            child: IconButton(
              onPressed: toggleFavorite,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? Colors.red
                    : Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.color, // Set the color here
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BtnNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
