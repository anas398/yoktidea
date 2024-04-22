
import 'package:get/get.dart';
import 'package:yuktidia/common/common.dart';
import 'package:yuktidia/screens/error.dart';


class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url]) : super(message.toString(), 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url]) {
    dprint(message);
    Get.to(()=>  const ErrorScreen());
  }
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url]) : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url]) {
    dprint(message);
    // Get.to(()=>   LoginScreen());
  }
}
