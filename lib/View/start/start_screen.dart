import 'package:flutter/material.dart';
import 'package:podcastapp/View/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/customer_button.dart';
import '../singin/view/signin_screen.dart';
import '../singup/view/registration_screen.dart';
import 'package:http/http.dart' as http;

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    String image = ((Theme.of(context).brightness == Brightness.light)
        ? "assets/Group.png"
        : "assets/Group_dark.png");

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          // color: Theme.of(context).textTheme.bodySmall?.color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.6,
              ),
              child: Text(
                "Listen to the best Podcast",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 32,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: const Text(
                "Your favorite artists in one place",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
              ),
              child: CustomerButtom(
                  title: 'Create new account',
                  onPressed: () {
                    //Navigate to the Sing in page.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => RgistrationScreens(),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: InkWell(
                onTap: () {
                  // Handle the onTap Navigate to the sing in
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SinginScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Sig',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NotoSans',
                      color: Theme.of(context).hintColor,
                    ), // Customize style as needed
                    children: <TextSpan>[
                      TextSpan(
                        text: 'n',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontFamily: 'NotoSans',
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      TextSpan(
                        text: ' In',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'NotoSans',
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedToken = prefs.getString('token') ?? "";

    // Check if the token is  exist,
    if (storedToken.isNotEmpty) {
      // Token is exist
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      // Token is not exist
    }
  }
}
