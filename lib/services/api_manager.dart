
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/services/app_exception.dart';




class ApiManager {



  var baseUrl = "https://studylancer.yuktidea.com";



  var postloding =false;

  fnLoading(){
    return Get.dialog(
      barrierDismissible: false, // user must tap button!
      barrierColor: Colors.transparent,
      const AlertDialog (
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: CupertinoActivityIndicator(
          animating: true,color: Colors.white,
          radius: 20,
        ),
      ),
    );
  }


  //==================================================================GET
  Future<dynamic> get(String api) async {
    dprint("END point>> ${api}");
    dprint("baseUrl>> ${baseUrl}");

    var uri = Uri.parse(baseUrl + api);
    dprint("URRRRRRIII >> ${uri}");
    try {
      var response = await http.get(uri);
      return _processResponse(response,false);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getLoading(String api) async {
    dprint("END point>> ${api}");
    dprint("baseUrl>> ${baseUrl}");
    fnLoading();
    var uri = Uri.parse(baseUrl + api);
    dprint("URRRRRRIII >> ${uri}");
    try {
      var response = await http.get(uri);
      return _processResponse(response,true);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  //==================================================================POST
  Future<dynamic> post(String api, dynamic body) async {
    dprint("Endpointtt.............. ${api}");
      // if(wstrIp != ""){
      //   baseUrl = wstrIp;
      // }
      var url="${baseUrl+'/'+ api}";
      var uri = Uri.parse(url);
      dprint("Uriiiddd......... ${uri}");
      var payload = body;
      try {
        var response = await http.post(uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              // 'COMPANY' : g.wstrCompany,
              // 'YEARCODE' : g.wstrYearcode,
              // 'TOKEN': g.wstrToken
            },
            body: payload);

        dprint("postLodingpostLoding>>> ${postloding}");


        return _processResponse(response,false);
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException('API not responded in time', uri.toString());
      }
  }


  Future<dynamic> postLoading(String api, dynamic body) async {
    fnLoading();
    dprint("Endpointtt.............. ${api}");


      var url="${baseUrl+'/'+ api}";
      var uri = Uri.parse(url);
      dprint("Uriiiddd......... ${uri}");


      var payload = body;
      try {
        var response = await http.post(uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              // 'COMPANY' : g.wstrCompany,
              // 'YEARCODE' : g.wstrYearcode,
              // 'TOKEN': g.wstrToken
            },
            body: payload);

        dprint(payload);

        return _processResponse(response,true);
      } on SocketException {
        Get.back();
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        Get.back();
        throw ApiNotRespondingException('API not responded in time', uri.toString());
      }


  }



  //==================================================================RESPONSE
  dynamic _processResponse(http.Response response,bool isLoading) {
    dprint("responseeeeeeeeeeeee");
    dprint(response.statusCode);
    dprint("POST___LOADING>>> ${isLoading}");
    if(isLoading){
      Get.back();
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 204:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException('BE100', response.request!.url.toString());
    }
  }






  //==========================================================================image
  //
  // Future<File> getFileFromUrl(String url, {name}) async {
  //   dprint("urllllllllll ${url}");
  //   var fileName = 'testonline';
  //   if (name != null) {
  //     fileName = name;
  //   }
  //   try {
  //     var data = await http.get(Uri.parse(url));
  //     dprint("detttttt>${data.bodyBytes}");
  //     var bytes = data.bodyBytes;
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/" + fileName + ".pdf");
  //     print("PAATHH>>>>> ${dir.path}");
  //     File urlFile = await file.writeAsBytes(bytes);
  //     return urlFile;
  //   } catch (e) {
  //     throw Exception("Error opening url file");
  //   }
  // }


}