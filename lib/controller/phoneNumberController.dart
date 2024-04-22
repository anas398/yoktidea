import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/common/widget/dialog.dart';
import 'package:yuktidia/global.dart';
import 'package:yuktidia/model/countrymodel.dart';
import 'package:yuktidia/screens/selectCountry/selectCountryImg.dart';
import 'package:yuktidia/screens/verifyNumber.dart';
import 'package:yuktidia/services/api_controller.dart';

class PhoneNumberController extends GetxController{
  late Future <dynamic> futureform;
  TextEditingController txtPhoneNumb = TextEditingController();
  RxString respMessage=''.obs;
  var g = Global();
  RxBool isTapResendButton=false.obs;
  RxBool isTapResendSussessButton=false.obs;


  apiGetOtp({code, num,role,context}){
    dprint("CODE >>>> ${code}");
    dprint("NUM >>>> ${num}");
    dprint("role >>>> ${role}");
    g.wstrPhoneNumber = num??"";
    futureform = ApiCall().apiGetOTPValue(code,num,role);
    futureform.then((value) => apiViewRes(value,context));
  }
  apiViewRes(value,context){
    dprint("VAAAAAL>>> ${value}");
    final res = value;
    if(res!=null){
      if(res["status"]==true){
        Get.to(VerifyNumber());
        respMessage.value = res["message"]!;
        dprint(" respMessage.value =.value  ${ respMessage.value}");
      }else{
        showAlertDialog(context: context,title: respMessage.value.toString(),desc:res["data"][0].toString() );
      }
    }


  }

  apiVerifyOtp({otp,context}){
    dprint("otp >>>> ${otp}");
    dprint("g.wstrPhoneNumber${g.wstrPhoneNumber}");

    futureform = ApiCall().apiVerifyOTP(otp,"${g.wstrcountryCode+g.wstrPhoneNumber}");
    futureform.then((value) => apiVerifyOtpRes(value,context));
  }
  apiVerifyOtpRes(value,context){
    dprint("apiVerifyOTP>>> ${value}");
    final res = value;
    if(res["status"]==true){
      g.wstrole= res["data"]["role"];
      g.wstrtoken= res["data"]["access_token"];

       Get.to(const SelectCountryImgScreen());
      // Get.to(VerifyNumber());
      // respMessage.value = res["message"]!;
      // dprint(" respMessage.value =.value  ${ respMessage.value}");
    }else{
      showAlertDialog(context: context,title: res["message"],desc:res["data"] );
    }

  }

  apiResendOtp(context){


    futureform = ApiCall().apiResendOTP("${g.wstrcountryCode+g.wstrPhoneNumber}");
    futureform.then((value) => apiResendOtpRes(value,context));
  }
  apiResendOtpRes(value,context){
    dprint("apiResendOtpRes>>> ${value}");
    final res = value;
    if(res["status"]==true){
      g.wstrole= res["data"]["role"];
      g.wstrtoken= res["data"]["access_token"];

      Get.to(const SelectCountryImgScreen());
      // Get.to(VerifyNumber());
      // respMessage.value = res["message"]!;
      // dprint(" respMessage.value =.value  ${ respMessage.value}");
    }else{

      showAlertDialog(context: context,title:res["message"] ,desc:res["data"][0].toString() );
    }

  }

}