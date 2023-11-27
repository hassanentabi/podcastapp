import 'package:flutter/material.dart';
import '../../constants.dart';
import '../View/forgotpassword/forgotpassword_screen.dart';

class ForgotText extends StatelessWidget {
  const ForgotText({required this.title, required this.btntitle});

  final String title;
  final String btntitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
          TextButton(
            onPressed: () {
              //-----------------
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForGotPasswordScreen(),
              ));

            },
            child: Text(
              btntitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Buttoncolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
