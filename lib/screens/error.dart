


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Row(
            children: [],
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(),
              Image.asset("assets/nointernet.gif",width: 200,),
              const Text('Connection Lost', style: TextStyle(
                color: Colors.black,
                fontSize: 15
              ),),
              const Text('Server connection lost, try again', style: TextStyle(
                  color: Colors.black,
                  fontSize: 10
              ),),
              const SizedBox(height: 10),
              GestureDetector(
           //     duration: const Duration(milliseconds: 110),
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Text('Close', style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                  ),),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
