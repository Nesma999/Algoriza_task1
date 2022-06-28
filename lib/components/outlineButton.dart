import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOutlineButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  const MyOutlineButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.teal),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        onPressed: (){
          onPressed();
        },
        icon:   FaIcon(icon,size: 20,),
        label:  Text(text),
        ),
    );
  }
}
