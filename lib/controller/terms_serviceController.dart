
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/model/termServiceModel.dart';
import 'package:yuktidia/services/api_controller.dart';

class TermsServieceController extends GetxController{

  late Future <dynamic> futureform;
  var datas;
  var title="".obs;
  var content="".obs;
  var updated_at ="".obs;
  apiTermsSERvice(){

    futureform = ApiCall().apiGetTermsServicet();
    futureform.then((value) => apiViewRes(value));
  }
  apiViewRes(value){
    dprint("VAAAdfgsdAAL>>> ${value}");
    final terms = TermServiceModel.fromJson(value);
    if(terms.status==true){
      datas = terms.data;
      title.value = datas.title;
      content.value = datas.content;
      updated_at.value = datas.updatedAt;
      dprint("datas.datas>> ${updated_at.value}");
      dprint("datas.updated_at>> ${updated_at.value}__ ${updated_at.value.runtimeType}");
      updated_at.value = setDate(1, DateTime.parse(datas.updatedAt)).toString();

      dprint("title.value >>> ${title.value }");
      dprint("content.value >>> ${content.value }");
      dprint("updated_at.value >>> ${updated_at.value }");
    }
  }
}