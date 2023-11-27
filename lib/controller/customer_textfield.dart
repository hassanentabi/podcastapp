import 'package:flutter/material.dart';
import '../../constants.dart';

class customerTextField extends StatefulWidget {
  const customerTextField({
    required this.title,
    this.onChanged,
    required this.iconData,
    required this.controller, // Add this line
  });

  final String title;
  final ValueChanged<String>? onChanged;
  final IconData iconData;
  final TextEditingController controller; // Add this line

  @override
  State<customerTextField> createState() => _customerTextFieldState();
}

class _customerTextFieldState extends State<customerTextField> {
  bool _isEmailValid = true;

  void _validateEmail(String email) {
    bool isValid =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);
    setState(() {
      _isEmailValid = isValid;
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
        onChanged: (value) {
          _validateEmail(value);
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
          errorText: _isEmailValid ? null : 'Incorrect Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

