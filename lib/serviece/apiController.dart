import 'dart:convert';

import 'package:nanohealth/serviece/api_manager.dart';
import 'package:nanohealth/serviece/app_exception.dart';
import 'package:nanohealth/serviece/base_controller.dart';

class ApiCall  with BaseController{
  Future<dynamic> apiLogin(usercd,password) async{
    var request = jsonEncode(<dynamic, dynamic>{
      'username':usercd,
      'password':password,

    });

    var response = await ApiManager().post('/auth/login',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    if (response == null) return;

    return response;

  }
  Future<dynamic> apiProduct() async{
    var response = await ApiManager().get('/products').catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    if (response == null) return;

    return response;
  }
  Future<dynamic> apiProductDetails(id) async{
    var response = await ApiManager().get('/products/${id}').catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    if (response == null) return;

    return response;
  }
}