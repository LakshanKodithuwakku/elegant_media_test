import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'app_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(backgroundColor: appbarcolor,splashIconSize: 400,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: width*0.15,
            width: width*0.6,
            decoration: BoxDecoration(
              color: appbarcolor,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/elegant_media_logo.jpg'),),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: Text(
              "ELEGANT MEDIA",
              style: TextStyle(
                  color: textBlack, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
