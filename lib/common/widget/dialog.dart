import 'package:flutter/material.dart';

void showAlertDialog({required BuildContext context, String? title, String ?desc}) {
  showDialog(barrierColor: Colors.black54,
    context: context,
    builder: (BuildContext context) {
      return Container(
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
        child: AlertDialog(backgroundColor:     const Color(0xFF343739) ,
          shadowColor:Colors.black54,

          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
         // insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,

          titlePadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          title:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toString(),style: TextStyle(
                color: Colors.green.shade700,fontSize: 15,fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 4,),
              Text(desc.toString(),style: const TextStyle(
                  color: Colors.white,fontSize: 12,fontWeight: FontWeight.w300
              ),),
            ],
          ),


        ),
      );
    },
  );
}