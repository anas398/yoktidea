import 'dart:ffi';

import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/common/widget/secondaryButton.dart';
import 'package:yuktidia/global.dart';
import 'package:yuktidia/screens/phoneNumber.dart';
import 'package:yuktidia/screens/startup/selectCountryController.dart';

class SelectCountry extends StatefulWidget {
  final String role;
  const SelectCountry({super.key, required this.role});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final SelectCountryController selectCountryController = Get.put(SelectCountryController());
  var g = Global();

  void _filterLogListBySearchText(String searchText) {
    dprint("searchText >>> ${searchText}");
    setState(() {

      // countryDetailList.value[index].name;
      // countryDetailList.value[index].telCode;
      selectCountryController.filteredList.value = selectCountryController.countryDetailList
          .where((logObj) =>
          logObj["name"].toLowerCase() .contains(searchText.toString().toLowerCase()))
          .toList();
    });
    dprint("selectCountryController.filteredList.value>> ${selectCountryController.filteredList.value.toString()}");
  }

  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 2
    ),(){
      selectCountryController.apiGetCountryList();
    });

    // TODO: implement initState
    super.initState();
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
                  const Text("Select your country",style:  TextStyle(fontSize: 25,fontWeight: FontWeight.w400,
                      color: Colors.white),),

                  const SizedBox(height: 20,),

                   TextField(controller: selectCountryController.txtSerachCountry,
                     style: const TextStyle(
                     color: Colors.white
                   ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Color(0xFFD9896A),),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),
                        hintText: "Search",
                        filled: true,
                        fillColor: Color(0XFF4B4E4F),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10.0)) ,
                          borderSide: BorderSide(color: Color(0XFF4B4E4F)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),

                          borderSide: BorderSide(color: Color(0XFF4B4E4F)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
    onChanged: (value) => _filterLogListBySearchText(value),
    onSubmitted: (value) => _filterLogListBySearchText(value),

                  ),
                  const SizedBox(height: 25,)
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(
             // itemCount:selectCountryController.countryDetailList.length ,
              itemCount:selectCountryController.filteredList.value.length ,

              itemBuilder: (context,index){
                // var name = selectCountryController.countryDetailList.value[index].name;
                // var code = selectCountryController.countryDetailList.value[index].telCode;
                // var image = selectCountryController.countryDetailList.value[index].flag;
                dprint(">>>>S  ${selectCountryController.filteredList.value[index]}");
                var name = selectCountryController.filteredList.value[index]["name"];
                var code = selectCountryController.filteredList.value[index]["tel_code"];
                var image = selectCountryController.filteredList.value[index]["flag"];
       
                return Bounce(
                  duration: Duration(milliseconds: 110),
                  onTap: (){
                    g.wstrcountryCode=code;
                    selectCountryController.filteredList.value =selectCountryController.countryDetailList.value;
                    selectCountryController.txtSerachCountry.text="";
                    Get.to(PhoneNumbScreen(role:widget.role,countryCode:code ,countryFlag: image,countryName: name));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),

                    decoration:  BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 12.0,
                            offset: const Offset(2.0, 0.15)
                        )
                      ],
                      color:  const Color(0xFF212426),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 22,width: 34,
                                  color: Colors.black54,
                                  child: SvgPicture.network(
                                    '${image}',
                                    fit: BoxFit.fill,

                                    placeholderBuilder: (BuildContext context) => Container(
                                        padding: const EdgeInsets.all(30.0),
                                        child: const CircularProgressIndicator(
                                          backgroundColor: Colors.redAccent,
                                        )),),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Text(name.toString(), style: const TextStyle(
                                      fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500
                                  ),),
                                )
                              ],
                            ),
                          ),
                          Text(code,
                            style: const TextStyle(
                                fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400
                            ),)
                        ],
                      ),
                    ),

                  ),
                );}))



        ],
      )),
    ));
  }
}
