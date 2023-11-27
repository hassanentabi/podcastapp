import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:podcastapp/View/category/view/category_screen.dart';
import '../../../Model/login_model.dart';
import '../../../constants.dart';
import '../../../controller/customer_button.dart';
import '../../../controller/customer_text.dart';
import '../../../controller/customer_textfield.dart';
import '../../../controller/forgot_text.dart';
import '../../../controller/password_textfield.dart';
import '../../../controller/social_button.dart';
import '../../../controller/title_text.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  //-----------------
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //-----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.09,
              left: kDefaultPadding,
              right: kDefaultPadding),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TitleText(title: 'Sign In'),
                ),
                const CustomerText(title: 'E-mail address'),
                customerTextField(
                  title: 'Email',
                  iconData: Icons.email_outlined,
                  controller: _emailController,
                ),
                const CustomerText(title: 'Password'),
                PasswordTextField(
                  iconData: Icons.lock_outline,
                  title: 'Password',
                  controller: _passwordController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.040,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: Image.asset('assets/Line 60.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.030,
                  ),
                  child: const Center(
                      child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButton(
                      title: 'Google   ',
                      image: 'assets/flat-color-icons_google.png',
                      onPressed: () {},
                    ),
                    SocialButton(
                      title: 'Facebook',
                      image: 'assets/logos_facebook.png',
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.099,
                ),
                CustomerButtom(
                  title: 'Sing In ',
                  onPressed: _loginUser,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                const ForgotText(
                  title: 'Forgot your password?',
                  btntitle: 'Click here',
                ),
                Container(
                  height: 2,
                  color: Buttoncolor,
                  margin: EdgeInsets.only(left: 240, right: 90),
                )
              ]),
        ),
      ),
    );
  }

  void _loginUser() async {
    // Get the text from controllers
    String email = _emailController.text.toString();
    String password = _passwordController.text.toString();

    // Check if any of the fields are empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // Call the register function
      bool registrationResult = await login(
        email,
        password,
      );

      // Check the result of the registration
      if (registrationResult) {
        // If successful, navigate to the Category Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
          ),
        );
      } else {
        // If registration fails, print a message
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Email or password is wrong',
        );
        print('Failed to login');
      }
    } else {
      // If any of the fields are empty, print a message
      print('All fields must be filled');
      // show alert
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Sorry, some fields are empty',
      );
    }
  }

  // function login take 2 parameter
  Future<bool> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://test.lavetro-agency.com/api/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var data = jsonDecode(response.body);

        // Parse the JSON into LoginModel
        LoginModel loginModel = loginModelFromJson(response.body);

        //print user and token in concle
        print(loginModel.user.name);
        print(loginModel.token);

        // Save the token to SharedPreferences to used
        await saveToken(loginModel.token , loginModel.user.name);

        print('Login successful');
        return true;
      } else {
        // Handle unsuccessful response
        print('Login failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print('Error during login: $e');
      return false;
    }
  }

  // save token in variable
  Future<void> saveToken(String token , String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', user);
  }
}
