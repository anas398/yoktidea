import 'package:get/get.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/global.dart';
import 'package:yuktidia/screens/selectCountry/selectCountryImg.dart';
import 'package:yuktidia/services/api_controller.dart';

class WelcomDelController extends GetxController{
  late Future <dynamic> futureform;
  var g = Global();
  apiDelete(){

    dprint("g.wstrtoken ${g.wstrtoken}");

    futureform = ApiCall().apiDeleteUser();
    futureform.then((value) => apiDeleteUseres(value));
  }
  apiDeleteUseres(value){
    dprint("apiDeleteUseres>>> ${value}");
    final res = value;



      // Get.to(VerifyNumber());
      // respMessage.value = res["message"]!;
      // dprint(" respMessage.value =.value  ${ respMessage.value}");
    }

  apiLogout(){

    dprint("g.wstrtoken ${g.wstrtoken}");

    futureform = ApiCall().apiLogoutUser();
    futureform.then((value) => apiDeleteUseres(value));
  }
  apiLogoutres(value){
    dprint("apiDeleteUseres>>> ${value}");
    final res = value;



    // Get.to(VerifyNumber());
    // respMessage.value = res["message"]!;
    // dprint(" respMessage.value =.value  ${ respMessage.value}");
  }

}