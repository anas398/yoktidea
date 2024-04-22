import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/common/widget/secondaryButton.dart';
import 'package:yuktidia/controller/terms_serviceController.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  final TermsServieceController termsServieceController = Get.put(TermsServieceController());
  @override
  void initState() {
   Future.delayed(Duration(
     seconds: 2
   ),(){
     termsServieceController.apiTermsSERvice();
   });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color(0xFF212426),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:Obx(() =>  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SecondaryButton(icon: Icons.close, tap: (){
                        print("clooooooooooooosee");
                        Get.back();
                      }, iconSize: 18,)],),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Container(
                          height: 80,
                          child: Image.asset("assets/doc.png")),
                      const SizedBox(width: 18,),
                      Container(
                        height: 55,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(termsServieceController.title.value.toString(),style: const TextStyle(color: Color(0xFFD9896A),fontWeight:FontWeight.w500,
                                fontSize: 16),),
                            const Spacer(),
                            Text("Update ${termsServieceController.updated_at.value}",style: const TextStyle(color: Colors.grey,fontWeight:FontWeight.w300,
                                fontSize: 14),),
                          ],
                        ),
                      ),
          
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                  const Text("Privacy Policy",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFD9896A)
                ),),
                  const SizedBox(height: 10,),
                  const Text("At studylancer, accessible from studylancer.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by studylancer and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in studylancer. This policy is not applicable to any information collected offline or via channels other than this website.",
                    style: TextStyle(
                        fontSize: 12,
          
                        color: Colors.white
                    ),
                  textAlign: TextAlign.justify,),
                  const SizedBox(height: 15,),
                  const Text("Consent",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFD9896A)
                    ),),
                  const SizedBox(height: 10,),
                  const Text("By using our website, you hereby consent to our Privacy Policy and agree to its terms.",
                    style: TextStyle(
                        fontSize: 12,
          
                        color: Colors.white
                    ),
                    textAlign: TextAlign.justify,),
                  const SizedBox(height: 15,),
                  const Text("Information we collect",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFD9896A)
                    ),),
                  const SizedBox(height: 10,),
                  const Text("The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.",
                    style: TextStyle(
                        fontSize: 12,
          
                        color: Colors.white
                    ),
                    textAlign: TextAlign.justify,)
          
                // Expanded(
                //   child: Text(termsServieceController.content.value.toString(),style:TextStyle(
                //       fontSize: 12,
                //
                //       color: Colors.white
                //   ),
                //     textAlign: TextAlign.start,),
                // )
          
          
              ],),)
          ),
        ),
      ),
    );
  }
}
