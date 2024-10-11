import 'package:flutter/material.dart';
import 'package:grabber/constant/app_color.dart';
import 'package:grabber/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // i want to add my own theme here but i don't know how to do it
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        fontFamily: "BalooDa2",
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: Colors.black,
        ),
      ),
      home: const SplashPage(),
    );
  }
}
