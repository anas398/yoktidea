import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/common/widget/dialog.dart';
import 'package:yuktidia/common/widget/secondaryButton.dart';
import 'package:yuktidia/controller/phoneNumberController.dart';
import 'package:yuktidia/screens/pinPut.dart';
import 'package:yuktidia/screens/selectCountry/selectCountryImg.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final PhoneNumberController phoneNumberController = Get.put(PhoneNumberController());
  String ? firstDigit ="";
  String ? secondDigit="";
  String ? thirdDigit ="";
  String ? fourthDigit="";
  String ? fifthDigit ="";
  String ? sixthDigit ="";
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  int _start = 10;
  Timer? _timer;
  @override
  void initState() {
    phoneNumberController.isTapResendButton.value=false;
    phoneNumberController.isTapResendSussessButton.value=false;
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      backgroundColor: const Color(0xFF212426),
      body: Obx(() => Column(
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
                  const Text("Verify Number",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w400,
                      color: Colors.white),),
                  const SizedBox(height: 12,),
                  const Text("Please enter the OTP received to\nverify your number",textAlign:
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Directionality(
                      // Specify direction if desired
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        length: 4,
                        keyboardType: TextInputType.number,
                        showCursor: true,
                        controller: pinController,

                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,

                        defaultPinTheme: defaultPinTheme,
                        errorText:'OTP does not match, please try again' ,
                        errorTextStyle: TextStyle(
                            color: Colors.redAccent.shade200.withOpacity(0.8)
                        ),
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        // validator: (value) {
                        //   return value == '2222' ? null : 'OTP does not match, please try again';
                        // },
                        // onClipboardFound: (value) {
                        //   debugPrint('onClipboardFound: $value');
                        //   pinController.setText(value);
                        // },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),

                          ),
                        ),
                        // submittedPinTheme: defaultPinTheme.copyWith(
                        //   decoration: defaultPinTheme.decoration!.copyWith(
                        //     color: Colors.black54,
                        //     borderRadius: BorderRadius.circular(19),
                        //
                        //   ),
                        // ),
                        // errorPinTheme: defaultPinTheme.copyWith(
                        //   co
                        //
                        //
                        // ),
                      ),
                    ),

                  ],
                ),
              )
          ),
          const Spacer(),
          const Text("Didn't receive OTP?",style: TextStyle(
              fontSize: 15,
              color: Colors.grey
          ),),
          const SizedBox(height: 20,),
          // const Text("Resend OTP?",style: TextStyle(
          //     fontSize: 18,
          //     color: Color(0xFFD9896A)
          // ),),

          TextButton(onPressed: (){
            phoneNumberController.isTapResendButton.value=true;
            setState(() {
              _start = 10;
            });
            startTimer();
            phoneNumberController.isTapResendSussessButton.value=true;
            phoneNumberController.apiResendOtp(context);
          },child: phoneNumberController.isTapResendButton.value==false? const Text( "Resend OTP?",
            style: TextStyle(
                  fontSize: 18,
                  color:  Color(0xFFD9896A)
              ),) :
          _start!=0 ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text( "Resending OTP in ",
                style: TextStyle(
                    fontSize: 16,
                    color:  Colors.grey)
                ),
              Text( "$_start Seconds",
                style: const TextStyle(
                    fontSize: 17,
                    color:  Color(0xFFD9896A)
                ))

                ],
              ):
          Text("OTP resent successfully",style: TextStyle(
                 fontSize: 18,
                 color: phoneNumberController.isTapResendButton.value? Colors.white: Color(0xFFD9896A)
             ),)



          //   child: phoneNumberController.isTapResendButton.value==false? Text( "Resend OTP?"):
          //   "Resending OTP in $_start Seconds",style: TextStyle(
          //     fontSize: 18,
          //     color: phoneNumberController.isTapResendButton.value? Colors.white: Color(0xFFD9896A)
          // ),)
          //   _start==0? Text("OTP resent successfully",style: TextStyle(
          //     fontSize: 18,
          //     color: phoneNumberController.isTapResendButton.value? Colors.white: Color(0xFFD9896A)
          // ),):SizedBox()
    ),
          const Spacer(),
          PrimaryButton(buttonName: "Verify", tap: (){
            focusNode.unfocus();
            dprint(" formKey.currentState!.validate()>> ${ formKey.currentState!.validate()}");
            if( formKey.currentState!.validate()){
              phoneNumberController.apiVerifyOtp(otp: pinController.text,context: context);
            }




            print("Get OTP.........");
          }),
          const Spacer(),
        ],
      ),)
    ));
  }


  // get _getInputField {
  //   return const PinputExample();
  // }
  Widget _otpTextField(String digit) {
    return Container(
      width: 30.0,
      height: 45.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
//            color: Colors.grey.withOpacity(0.4),
          border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: Colors.grey.withOpacity(0.6),
              ))),
      child: new Text(
        digit.toString() != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.transparent),
    ),
  );

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
