import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/common/widget/secondaryButton.dart';
import 'package:yuktidia/controller/phoneNumberController.dart';
import 'package:yuktidia/screens/verifyNumber.dart';

class PhoneNumbScreen extends StatefulWidget {
  final String countryCode;
  final String countryFlag;
  final String countryName;
  final String role;



  const PhoneNumbScreen({super.key, required this.countryCode, required this.countryFlag, required this.countryName, required this.role});

  @override
  State<PhoneNumbScreen> createState() => _PhoneNumbScreenState();
}

class _PhoneNumbScreenState extends State<PhoneNumbScreen> {
  final PhoneNumberController phoneNumberController = Get.put(PhoneNumberController());

  @override
  Widget build(BuildContext context) {
    dprint(widget.countryCode);
    dprint(widget.countryFlag);
    dprint(widget.countryName);
    return SafeArea(child: Scaffold(

      backgroundColor: const Color(0xFF212426),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 12.0,
                    offset: Offset(0.0, 0.15)
                )
              ],
              color:  Color(0xFF212426),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SecondaryButton(icon: Icons.arrow_back_ios_sharp, tap: (){
                     print("clooooooooooooosee");
                     Get.back();
                     }, iconSize: 20)



                      ],),
                  ),
                  const Text("Enter phone number",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w400,
                      color: Colors.white),),
                  const SizedBox(height: 12,),
                  const Text("Please enter your 10 digit mobile \nnumber to receive OTP",textAlign:
                    TextAlign.center,style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFD9896A)
                  ),),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 55,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: TextField(
              cursorColor: Colors.white,

              controller: phoneNumberController.txtPhoneNumb,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 9),
                counterText: "",
    enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white38),
    ),
    focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white38),
    ),

                prefixIcon:   Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                     // padding: EdgeInsets.symmetric(vertical: 12,horizontal: 4),
                      height: 17,width: 30,
                      child: SvgPicture.network(
                        widget.countryFlag,
                        fit: BoxFit.fill,
                        semanticsLabel: 'A shark?!',
                        placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(10.0),
                            child: const CircularProgressIndicator(
                              backgroundColor: Colors.redAccent,
                            )),),
                    ),
                    const SizedBox(width: 20,),
                    Text(widget.countryCode,style: const TextStyle(fontSize: 18,color: Colors.white),),
                    const SizedBox(width: 10,),
                  ],
                ),



              ),
              maxLines: 1,
              maxLength: 10,
              style: const TextStyle(
                color: Colors.white,fontSize: 18

              ),
              keyboardType: TextInputType.number,
            ),
          ),
            const Spacer(),
           PrimaryButton(buttonName: "Get OTP", tap: (){
            print("Get OTP.........");

            phoneNumberController.apiGetOtp(code: widget.countryCode,role:widget.role,num: phoneNumberController.txtPhoneNumb.text);

          }),
          const Spacer(),
        ],
      ),
    ));
  }


}
