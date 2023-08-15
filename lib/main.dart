import 'package:elegant_media_test/screens/app_login_screen.dart';
import 'package:elegant_media_test/screens/hotel_list_screen.dart';
import 'package:elegant_media_test/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'ELEGANT MEDIA TEST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),//HotelListScreen(),
    );
  }
}


