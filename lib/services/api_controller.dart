


import 'dart:convert';

import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/global.dart';
import 'package:yuktidia/services/api_manager.dart';
import 'package:yuktidia/services/app_exception.dart';
import 'package:yuktidia/services/base_controller.dart';

class ApiCall  extends BaseController{

  var g = Global();
  Future<dynamic> apiGetCountryList() async{
    // var request = jsonEncode(<dynamic, dynamic>{
    //   'USER_NAME':usercd,
    //   'USER_PWD':password,
    // });
    // dprint("s");
    // dprint(request);
    var response = await ApiManager().getLoading('/api/countries').catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiGetSelectCountry() async{

    var response = await ApiManager().getLoading('/api/select/country').catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiGetOTPValue(code,number,role) async{
    var request = jsonEncode(<dynamic, dynamic>{
        "tel_code" : code,
        "phone" : number,

    });
    dprint('/api/student/login');
    dprint(request);
    String endPoint= role=="student"?"student":"counsellor";
    var response = await ApiManager().postLoading('api/${endPoint}/login',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiVerifyOTP(otp,number) async{
    dprint("number>>>${number}");
    var request = jsonEncode(<dynamic, dynamic>{
        "code" : otp,
        "phone" : number,

    });
    dprint('/api/verify-otp');
    dprint(request);
    var response = await ApiManager().postLoading('api/verify-otp',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiResendOTP(number) async{
    dprint("number>>>${number}");
    var request = jsonEncode(<dynamic, dynamic>{
        "phone" : number,

    });
    dprint('/api/verify-otp');
    dprint(request);
    var response = await ApiManager().postLoading('api/verify-otp',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }

  Future<dynamic> apiGetTermsServicet() async{

    var response = await ApiManager().getLoading('/api/terms-conditions').catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }

  Future<dynamic> apiDeleteUser() async{

    var request = jsonEncode(<dynamic, dynamic>{
      "Bearer" : g.wstrtoken,
    });
    dprint('/api/delete');
    dprint(request);
    var response = await ApiManager().post('api/delete',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiLogoutUser() async{

    var request = jsonEncode(<dynamic, dynamic>{
      "Bearer" : g.wstrtoken,
    });
    dprint('/api/logout');
    dprint(request);
    var response = await ApiManager().post('api/logout',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }

  Future<dynamic> apiGetSelectdCountry(country_id) async{
    dprint("idid>>>> ${country_id}");


    var request = jsonEncode(<dynamic, dynamic>{
      "country_id" : country_id,

    });
    dprint('/api/select/country');
    dprint(request);
    var response = await ApiManager().post('api/select/country',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint("response,,,,,,,");
    dprint(response);
    if (response == null) return;

    return response;

  }


}