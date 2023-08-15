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
        fixedSize: Size(double.infinity, 50),
        primary: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ),
      onPressed: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( title , style: TextStyle(
              color: textBlack,
            )
          ),
        ],
      ),
    );
  }
}