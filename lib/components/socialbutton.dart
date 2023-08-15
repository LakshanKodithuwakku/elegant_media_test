import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  double width;
  double height;
  String text;
  Function onPressed;
  Color color;
  String logo;

  SocialButton(
      {required this.width,
      required this.height,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(this.color),
          shape: MaterialStateProperty.all<CircleBorder>(
            CircleBorder(),
          ),
        ),
        child: Image.asset(
          this.logo,
          fit: BoxFit.fill,
        ),
        onPressed: () {},
      ),
    );
  }
}
