import 'package:get/get.dart';
import 'package:nanohealth/views/product.dart';

import '../serviece/apiController.dart';

class ProductController extends GetxController{
  late Future <dynamic> futureform;
  var productList = [].obs;
  var prdetails= [].obs;
  var flexValue =3.obs;






  fnExpandOrnor(){

    flexValue.value =flexValue.value ==4?3:4;
  }


  fnProduct(){
    futureform = ApiCall().apiProduct();
    futureform.then((value) => apiProductRes(value));
  }
  apiProductRes(value){
    productList.value = value;


  }



  fnProductDetails(id){
    futureform = ApiCall().apiProductDetails(id);
    futureform.then((value) => apiProductDetailsRes(value));
  }
  apiProductDetailsRes(value_det){

    prdetails.add(value_det);
    update();
  }

}