
import 'package:flutter/material.dart';
import '../../constants.dart';

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({
    required this.title,
    this.onChanged,
    required this.iconData,
    required this.controller,

  });

  final String title;
  final ValueChanged<String>? onChanged;
  final IconData iconData;
  final TextEditingController controller; // Add this line

  @override
  State<UsernameTextField> createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  TextEditingController _usernameController = TextEditingController();

  bool _isUsernameValid = true;

  void _validateUsername(String username) {
    // Implement username validation logic here
    bool isValid = RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username);
    setState(() {
      _isUsernameValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.030,
      ),
      child: TextField(
        controller: widget.controller, // Use the provided controller

//        controller: _usernameController,
        onChanged: (value) {
          _validateUsername(value);
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Icon(
              widget.iconData,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          hintText: widget.title,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText: _isUsernameValid ? null : 'Invalid Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
