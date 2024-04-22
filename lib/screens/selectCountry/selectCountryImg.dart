import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/common/widget/secondaryButton.dart';
import 'package:yuktidia/screens/selectCountry/welcomDelLogout.dart';
import 'package:yuktidia/screens/startup/selectCountryController.dart';
import 'package:yuktidia/screens/startup/welcome_screen.dart';

class SelectCountryImgScreen extends StatefulWidget {
  const SelectCountryImgScreen({super.key});

  @override
  State<SelectCountryImgScreen> createState() => _SelectCountryImgScreenState();
}

class _SelectCountryImgScreenState extends State<SelectCountryImgScreen> {
  final SelectCountryController selectCountryController = Get.put(
      SelectCountryController());

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),() {
      selectCountryController.apiGetCountryList();
    },);


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
              color: Color(0xFF212426),
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
                        SecondaryButton(icon: Icons.arrow_back_ios_sharp,
                            tap: () {
                              print("clooooooooooooosee");
                              Get.back();
                            },
                            iconSize: 20)


                      ],),
                  ),
                  const Text("Select Country",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400,
                        color: Colors.white),),
                  const SizedBox(height: 12,),
                  const Text(
                    "Please select the country where \nyou want to study",
                    textAlign:
                    TextAlign.center, style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFD9896A)
                  ),),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 55,),

          Obx(() =>  Wrap(
              spacing: 30,

              runSpacing: 30,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: wItemList(context)
          ),),


          const Spacer(),
          PrimaryButton(buttonName: "Proceed", tap: () {
            print("Proceed.........");
            Get.to(const WelcomLogOut());
          }),
          const SizedBox(height: 20,),
          const Text("Can't see the country of your interest?", style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13, color: Colors.white
          ),),
          const SizedBox(height: 20,),
          const Text("Consult with us", style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18, color: Color(0xFFD9896A)
          ),),
          const Spacer(),
        ],
      )),
    ));
  }

  Widget CountryButton({String ? img, String ? name,int ? id}) {
    return GestureDetector(
      onTap: (){

        selectCountryController.apiGetSelectedCountry(id);
      },
      child: Column(
        children: [
          Container(
              height: 85, width: 85,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(img!),
                      fit: BoxFit.fill
                  )


              )
          ),
          const SizedBox(height: 10,),
          Text(name.toString(), textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 16
            ),)
        ],
      ),
    );
  }

  List<Widget> wItemList(context) {
    List<Widget> rtnList = [];

    for (var e in selectCountryController.countryDetailList.value) {
      dprint("****** >> ${selectCountryController.countryDetailList.value}");
      var id = (e.id ?? "").toString();
      var name = (e.name ?? "").toString();
      var flag = (e.flag?? "").toString();
      var image = (e["image"] ?? "").toString();

      rtnList.add(CountryButton(name: name, img: image,id: int.parse(id)));
    }
    return rtnList;
  }
}
