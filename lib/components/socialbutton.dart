import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SocialButton extends StatelessWidget {
  String imagePath;
  final GestureTapCallback? onTap;

  SocialButton({
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
        icon: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    height: 50,
                    width: 50,
                    color: backgroundWhite,
                    child: Image.asset(imagePath)))));
  }
}
