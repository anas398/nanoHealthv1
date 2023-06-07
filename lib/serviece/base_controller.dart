


import 'package:get/get.dart';
import 'package:nanohealth/serviece/app_exception.dart';


class BaseController {
  void  handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;

      Get.off(() =>  Error());

    } else if (error is FetchDataException) {
      var message = error.message;
      //Fluttertoast.showToast(msg: message.toString());
      //showToast(message.toString());

    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      //Fluttertoast.showToast(msg: message.toString());
      //showToast(message.toString());
      Get.off(() =>  Error());
    }
  }
}