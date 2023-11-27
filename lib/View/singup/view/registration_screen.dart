//import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/register_model.dart';
import '../../../constants.dart';
import '../../../controller/customer_button.dart';
import '../../../controller/customer_text.dart';
import '../../../controller/customer_textfield.dart';
import '../../../controller/password_textfield.dart';
import '../../../controller/social_button.dart';
import '../../../controller/title_text.dart';
import '../../../controller/username_texfield.dart';
import '../../singin/view/signin_screen.dart';

class RgistrationScreens extends StatefulWidget {
  const RgistrationScreens({super.key});

  @override
  State<RgistrationScreens> createState() => _RgistrationScreensState();
}

class _RgistrationScreensState extends State<RgistrationScreens> {
//---------------
  // text editing controller for all email and password and username
  bool isClike = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

//----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
                child: const TitleText(title: 'Create new account'),
              ),
              const CustomerText(title: 'Full name'),
              UsernameTextField(
                title: 'Username',
                iconData: Icons.person_outline,
                controller: _usernameController,
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
              Row(
                children: [
                  Checkbox(
                    checkColor: Backgroundcolor,
                    activeColor: Darkcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.5),
                      side: const BorderSide(color: Colors.orange),
                    ),
                    value: isClike,
                    onChanged: (value) => setState(() {
                      isClike = value!;
                    }),
                  ),
                  const Text(
                    'I agree with Terms and Privacy Policy',
                    style: TextStyle(color: Color(0xFFA7A6A5)),
                  )
                ],
              ),
              Container(
                height: 38,
                child: Image.asset('assets/Line 60.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030,
              ),
              const Center(
                  child: Text(
                'OR',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )),
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
                height: MediaQuery.of(context).size.height * 0.060,
              ),
              CustomerButtom(
                title: 'Create new account',
                onPressed: _registerUser,
              )
            ],
          ),
        ),
      ),
    );
  }

  // function
  // function register used when create new user and check if all
  // fields are empty and generate phone number
  void _registerUser() async {
    // Get the text from controllers
    String username = _usernameController.text.toString();
    String email = _emailController.text.toString();
    String password = _passwordController.text.toString();

    // Check if any of the fields are empty
    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      // Generate a random number with 7 digits (phone number )
      Random random = Random();
      int randomNumber = random.nextInt(9000000) + 1000000;

      // Call the register function
      bool registrationResult = await register(
        username,
        email,
        password,
        '111',
        randomNumber.toString(),
      );

      // Check the result of the registration
      if (registrationResult) {
        // If successful, navigate to the SignInScreen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SinginScreen(),
          ),
        );
      } else {
        // If registration fails, print a message
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Oops...',
          text: 'Sorry, Failed to register as a new user',
        );
        print('Failed to register');
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

  // function register take 5 parameter to used url and responce all information
  Future<bool> register(String name, String email, String password,
      String phoneCode, String phone) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://test.lavetro-agency.com/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone_code': phoneCode,
          'phone': phone,
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //var data = jsonDecode(response.body);

        // Parse the JSON into RegisterModel
        RegisterModel registrationModel = registerModelFromJson(response.body);

        // print user and token only
        print(registrationModel.user.name);
        print(registrationModel.token);

        // Save the token to SharedPreferences to used
        await saveToken(registrationModel.token , registrationModel.user.name);

        print('Registration successful');

        return true;
      } else {
        // Handle unsuccessful response and prent code
        print('Registration failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle exceptions when error registration
      print('Error during registration: $e');
      return false;
    }
  }

  // save token in variable
  Future<void> saveToken(String token ,String user ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', user);

  }
}
