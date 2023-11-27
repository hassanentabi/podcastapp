import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../controller/customer_button.dart';
import '../../../controller/customer_text.dart';
import '../../../controller/customer_textfield.dart';
import '../../../controller/title_text.dart';

class ForGotPasswordScreen extends StatefulWidget {
  const ForGotPasswordScreen({super.key});

  @override
  State<ForGotPasswordScreen> createState() => _ForGotPasswordScreenState();
}

class _ForGotPasswordScreenState extends State<ForGotPasswordScreen> {
  //-----------------
  final TextEditingController _emailController = TextEditingController();

  //-----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
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
                  child: TitleText(title: 'reset password'),
                ),
                const CustomerText(title: 'Enter your E-mail address to get link '),
                customerTextField(
                  title: 'Email',
                  iconData: Icons.email_outlined,
                  controller: _emailController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomerButtom(
                  title: 'Reset Password ',
                  onPressed: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
              ]),
        ),
      ),
    );
  }
}
