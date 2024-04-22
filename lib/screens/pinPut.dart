// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';
// import 'package:yuktidia/controller/phoneNumberController.dart';
//
// /// For more examples check out the demo directory
// class PinputExample extends StatefulWidget {
//   const PinputExample({Key? key}) : super(key: key);
//
//   @override
//   State<PinputExample> createState() => _PinputExampleState();
// }
//
// class _PinputExampleState extends State<PinputExample> {
//   final PhoneNumberController phoneNumberController = Get.put(PhoneNumberController());
//
//
//   @override
//   void dispose() {
//     phoneNumberController.pinController.dispose();
//     phoneNumberController.focusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
//     // const fillColor = Color.fromRGBO(243, 246, 249, 0);
//     // const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
//
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Colors.white,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         border: Border.all(color: Colors.transparent),
//       ),
//     );
//
//     /// Optionally you can use form to validate the Pinput
//     return Form(
//       key: phoneNumberController.formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Directionality(
//             // Specify direction if desired
//             textDirection: TextDirection.ltr,
//             child: Pinput(
//               length: 4,
//               keyboardType: TextInputType.number,
//               showCursor: true,
//               controller: pinController,
//               focusNode: phoneNumberController.focusNode,
//               androidSmsAutofillMethod:
//               AndroidSmsAutofillMethod.smsUserConsentApi,
//               listenForMultipleSmsOnAndroid: true,
//               defaultPinTheme: defaultPinTheme,
//               errorText:'OTP does not match, please try again' ,
//               errorTextStyle: TextStyle(
//                 color: Colors.redAccent.shade200.withOpacity(0.7)
//               ),
//               separatorBuilder: (index) => const SizedBox(width: 8),
//               validator: (value) {
//                 return value == '2222' ? null : 'OTP does not match, please try again';
//               },
//               // onClipboardFound: (value) {
//               //   debugPrint('onClipboardFound: $value');
//               //   pinController.setText(value);
//               // },
//               hapticFeedbackType: HapticFeedbackType.lightImpact,
//               onCompleted: (pin) {
//                 debugPrint('onCompleted: $pin');
//               },
//               onChanged: (value) {
//                 debugPrint('onChanged: $value');
//               },
//               cursor: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 9),
//                     width: 22,
//                     height: 2,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//               focusedPinTheme: defaultPinTheme.copyWith(
//                 decoration: defaultPinTheme.decoration!.copyWith(
//                   borderRadius: BorderRadius.circular(8),
//
//                 ),
//               ),
//               // submittedPinTheme: defaultPinTheme.copyWith(
//               //   decoration: defaultPinTheme.decoration!.copyWith(
//               //     color: Colors.black54,
//               //     borderRadius: BorderRadius.circular(19),
//               //
//               //   ),
//               // ),
//               // errorPinTheme: defaultPinTheme.copyWith(
//               //   co
//               //
//               //
//               // ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }