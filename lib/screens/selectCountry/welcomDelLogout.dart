import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidia/common/widget/secondaryButton.dart';
import 'package:yuktidia/controller/wlcmDelController.dart';

class WelcomLogOut extends StatefulWidget {
  const WelcomLogOut({super.key});

  @override
  State<WelcomLogOut> createState() => _WelcomLogOutState();
}

class _WelcomLogOutState extends State<WelcomLogOut> {
  final WelcomDelController welcomDelController =Get.put(WelcomDelController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xFF212426),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome",style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 30,),
            PrimaryButton(buttonName: "Logout", tap: (){
              welcomDelController.apiLogout();

              print("logout,,,,,,,,,,,,,");
            }),
            SizedBox(height: 25,),
            PrimaryButton(buttonName: "Delete User", tap: (){
              welcomDelController.apiDelete();

              print("Delete User,,,,,,,,,,,,,");
            })
          ],
        ),
      ),
    ));
  }
}
