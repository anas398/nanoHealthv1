import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nanohealth/style/colors.dart';
import 'package:nanohealth/views/product.dart';

import '../serviece/apiController.dart';

class LoginController extends GetxController{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var passwordVisible = false.obs;
  late Future <dynamic> futureform;
  //Controller
  var txtEmail  = TextEditingController();
  var txtPassword  = TextEditingController();

  fnVisible(){
    passwordVisible.value = !passwordVisible.value;
    update();
  }
  fnLogin(){
    futureform = ApiCall().apiLogin(txtEmail.text.toString().trim(),txtPassword.text.toString().trim());
    futureform.then((value) => apiLoginRes(value));
  }
  apiLoginRes(value){
     if(value==null || value=="" ){
       Fluttertoast.showToast(
           msg: "username or password is incorrect",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: color1,
           textColor: Colors.black,
           fontSize: 16.0
       );
     }else{
       var token  =  value["token"];
       if(token!=null){
         Get.to(ProductScreen());
       }



     }



    }
  }


