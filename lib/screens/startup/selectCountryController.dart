import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/model/countrymodel.dart';
import 'package:yuktidia/model/selectCountryModel.dart';
import 'package:yuktidia/services/api_controller.dart';

class SelectCountryController extends GetxController {

  late Future <dynamic> futureform;
  RxList countryDetailList = [].obs;
  RxList countryList = [].obs;
  RxList filteredList = [].obs;
  TextEditingController txtSerachCountry = TextEditingController();
  RxBool selectedCountry=false.obs;

  apiGetCountryList() {
    futureform = ApiCall().apiGetCountryList();
    futureform.then((value) => apiViewRes(value));
  }

  apiViewRes(value) {
    dprint("VAAasdcasaAAAL>>> ${value}");
    final country = value["data"];
    if (value["status"] == true) {
      dprint("country>>>>   ${country}");
      countryDetailList.value = country;
      filteredList.value = countryDetailList.value;
      dprint("oQWERQWRst.value  ${countryDetailList.value}");
    }
  }


  apiGetSelectedCountry(country_id) {
    futureform = ApiCall().apiGetSelectdCountry(country_id);
    futureform.then((value) => apiGetSelectdCountryRes(value));
  }

  apiGetSelectdCountryRes(value) {
    dprint("apiGetSelectdCountryRes>>> ${value}");
  }
}

