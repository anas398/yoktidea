import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


dprint(msg){
  if (kDebugMode) {
    print(msg);
  }
}

setDate(mode,DateTime date){
  var dateRtn  = "";
  var formatDate1 = DateFormat('dd/MM/yyy');



  try{
    switch(mode){
      case 1:{
        dateRtn =  formatDate1.format(date);
      }
      break;

      default: {
        //statements;
      }
      break;

    }



  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }

  return dateRtn;

}