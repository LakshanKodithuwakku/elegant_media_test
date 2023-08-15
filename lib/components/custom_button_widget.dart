import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButtonWidget extends StatelessWidget {

  final Color backgroundColor;
  final String title;
  final String icon; 
  final String preIcon;

  final Function()? onTap;
  const CustomButtonWidget({ Key? key, this.backgroundColor = appbarcolor, this.title= "", this.icon = "", this.preIcon = "", this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: appbarcolor, // Set the background color
        foregroundColor: textWhite, // Set the text color
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10), // Set padding
        textStyle: TextStyle(fontSize: 18), // Set text style
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Set border radius
        ),
      ),
      onPressed: onTap,
      child: Text(title)
    );
  }
}