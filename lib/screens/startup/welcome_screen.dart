import 'dart:ui';

import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yuktidia/screens/startup/select%20country.dart';
import 'package:yuktidia/screens/termsOfService_screen.dart';

class WelecomeScreen extends StatefulWidget {
  const WelecomeScreen({super.key});

  @override
  State<WelecomeScreen> createState() => _WelecomeScreenState();
}

class _WelecomeScreenState extends State<WelecomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(
                                    'assets/jump.png'),
                                fit: BoxFit.fill,
                              ),)
                ),
              ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.4,
              child: Container(
                decoration: const BoxDecoration(
                color: Color(0xFF1F1F1F),
                 borderRadius: BorderRadius.only(topRight: Radius.circular(33),
                 topLeft:Radius.circular(33), )
                ),
                child:  Column(
                  children: [
                    const SizedBox(height: 18,),
                    const Text("Welcome to Study Lancer",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                    color: Colors.white),),
                    const Text("Please select your role to get registered",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,
                        color: Colors.white),),
                    Row(
                      children: [
                        roleWidget(img: "assets/student.png",role: "Student",tap: (){
                          print("Student......................");
                          Get.to(SelectCountry(role: "student",));
                        }),
                        roleWidget(img: "assets/agent.png",role: "Agent",tap: (){
                          Get.to(SelectCountry(role: "agent",));
                          print("Agent......................");
                        })
                      ],
                    ),
                   const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By continuing you agree to our",style:  TextStyle(fontSize: 11,fontWeight: FontWeight.w200,
                          color: Colors.white,),),
                        Bounce(duration: Duration(milliseconds: 110),
                          onTap: (){
                            Get.to(TermsOfService());
                          },
                          child: Text(" Terms and Condition",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,
                              color: Color(0xFFD9896A)),),
                        )

                      ],
                    )
                  ],
                ),
      
                ),
              ),
      
          ],
        )
      ),
    );
  }
}


Widget roleWidget({String ? img,String? role,VoidCallback? tap}){
  return Bounce(
    duration: Duration(milliseconds: 10),

    onTap: tap,
    child: Stack(
      children: [
        Image.asset(img!),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Center(
            child: Text(role!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,
                fontSize: 16),),
          ),
        )
      ],
    ),
  );

}