import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType keyboard;
  final String hintText;
  final String validate;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? prefix;
  final Function? iconButton;
  final IconData? suffix;
  const MyTextField(
      {required this.hintText,
      required this.controller,
      required this.validate,
      required this.keyboard,
      this.prefix,
      this.suffix,
      this.iconButton,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: prefix,
        suffixIcon: IconButton(
          onPressed: () {
            iconButton!();
          },
          icon: Icon(suffix),
        ),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
      },
    );
  }
}
