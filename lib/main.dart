import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidia/screens/selectCountry/selectCountryImg.dart';
import 'package:yuktidia/screens/selectCountry/welcomDelLogout.dart';
import 'package:yuktidia/screens/startup/select%20country.dart';
import 'package:yuktidia/screens/startup/welcome_screen.dart';
import 'package:yuktidia/screens/phoneNumber.dart';
import 'package:yuktidia/screens/verifyNumber.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yuktidia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
     // home:  VerifyNumber()
      home:  WelecomeScreen()
    );
  }
}


