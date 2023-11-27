import 'package:flutter/material.dart';
import 'package:podcastapp/View/start/start_screen.dart';

import 'View/home/home_page.dart';
import 'View/player/view/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xffF9F7F5),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black),
          // Change headline text color to red
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
          // Add more text styles as needed
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white), // Change label text color
          hintStyle: TextStyle(color: Colors.white), // Change hint text color
        ),

        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff525050),
        hintColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white), // Change label text color
          hintStyle: TextStyle(color: Color(0xff343434)), // Change hint text color
        ),
       // highlightColor:  Colors.white ,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          // Change headline text color to red
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),
          // Add more text styles as needed
        ),
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
