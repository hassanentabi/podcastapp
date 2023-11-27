import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.iconData,
    required this.title,
    required this.controller,
    this.onChanged,
  });

  final String title;
  final ValueChanged<String>? onChanged;
  final IconData iconData;
  final TextEditingController controller; // Add this line

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  //TextEditingController _passwordController = TextEditingController();
  bool _isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.030,
      ),
      child: Column(
        children: [
          TextField(
            controller: widget.controller, // Use the provided controller
            //controller: _passwordController, // Use the controller for better control
            onChanged: (password) {
              _validatePassword(password);
              if (widget.onChanged != null) {
                widget.onChanged!(password);
              }
            },
            obscureText: _obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.01),
                child: Icon(
                  widget.iconData,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              hintText: widget.title,
              errorText: _isPasswordValid ? null : 'Password must be 8-20 characters',
              suffixIcon: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.5),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = password.length >= 8 && password.length <= 20;
    });
  }
}


// import 'package:flutter/material.dart';
// import '../../constants.dart';
//
// class PasswordTextField extends StatefulWidget {
//   const PasswordTextField(
//       {required this.iconData, required this.title, this.onChanged});
//
//   final String title;
//   final ValueChanged<String>? onChanged;
//   final IconData iconData;
//
//   @override
//   _PasswordTextFieldState createState() => _PasswordTextFieldState();
// }
//
// class _PasswordTextFieldState extends State<PasswordTextField> {
//   bool _obscureText = true;
//
//   TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordValid = true;
//
//   void _validatePassword(String password) {
//     // تنفيذ الشروط الخاصة بكلمة المرور هنا
//     bool isValid = password.length >= 8 && password.length <= 20;
//     setState(() {
//       _isPasswordValid = isValid;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).size.height * 0.030,
//       ),
//       child: Column(
//         children: [
//           TextField(
//             onChanged: widget.onChanged,
//             obscureText: _obscureText,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor:
//                   Theme.of(context).inputDecorationTheme.hintStyle?.color,
//               prefixIcon: Padding(
//                 padding: EdgeInsets.only(
//                   left: MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 child: Icon(
//                   widget.iconData,
//                   color: Theme.of(context).textTheme.bodySmall?.color,
//                 ),
//               ),
//               hintText: widget.title,
//               errorText: _isPasswordValid ? null : 'Incorrect password',
//               suffixIcon: Padding(
//                 padding: EdgeInsets.all(
//                   MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 child: IconButton(
//                   icon: Icon(
//                     _obscureText ? Icons.visibility : Icons.visibility_off,
//                     color: Theme.of(context).iconTheme.color
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _obscureText = !_obscureText;
//                     });
//                   },
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18.5),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// if (_isPasswordValid) {
// String password = _passwordController.text;

// import 'package:flutter/material.dart';
// import '../../constants.dart';
//
// class PasswordTextField extends StatefulWidget {
//   const PasswordTextField(
//       {required this.iconData, required this.title, this.onChanged});
//
//   final String title;
//   final ValueChanged<String>? onChanged;
//   final IconData iconData;
//
//   @override
//   _PasswordTextFieldState createState() => _PasswordTextFieldState();
// }
//
// class _PasswordTextFieldState extends State<PasswordTextField> {
//   bool _obscureText = true;
//   bool _showErrorMessage = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.only(
//         bottom: MediaQuery.of(context).size.height * 0.030,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (_showErrorMessage)
//             const Text(
//               'Incorrect password',
//               style: TextStyle(
//                 color: Colors.red,
//                 fontSize: 12,
//               ),
//             ),
//           TextField(
//             onChanged: widget.onChanged,
//             obscureText: _obscureText,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Theme.of(context).inputDecorationTheme.hintStyle?.color,
//               prefixIcon: Padding(
//                 padding: EdgeInsets.only(
//                   left : MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 child: Icon(widget.iconData,color: Theme.of(context).textTheme.bodySmall?.color, ),
//               ),
//               hintText: widget.title,hintStyle: TextStyle(
//               color: Theme.of(context).inputDecorationTheme.labelStyle?.color
//             ),
//               suffixIcon: Padding(
//                 padding: EdgeInsets.all(
//                   MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 child: IconButton(
//                   icon: Icon(
//                     _obscureText ? Icons.visibility : Icons.visibility_off,
//                     color:  Theme.of(context).iconTheme.color,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _obscureText = !_obscureText;
//                     });
//                   },
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18.5),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
