import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../controller/productController.dart';
import '../style/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    print("IDDDDDDDDDDD >>>>> >>> ${widget.id}");

    Future.delayed(const Duration(
        seconds: 2),() => productController.fnProductDetails(widget.id),
    );


    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    productController.prdetails.value =[];
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: Obx(() => productController.prdetails.value.isEmpty? const Center(
          child: CircularProgressIndicator(color: color1),
        ):
        Column(
          children: [
            Flexible(
                flex: 7,
                fit: FlexFit.loose ,
                child: Container(
                  decoration:  BoxDecoration(
                    color: color1,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        opacity: 35,

                        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.color),
                        image: NetworkImage(productController.prdetails.value[0]["image"])),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 10,left: 10,bottom: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Bounce(
                                      duration: const  Duration(milliseconds: 110),
                                      onPressed: (){
                                        Get.back();
                                      },
                                      child: wIconContainer(Icons.arrow_back_sharp,Colors.black)
                                  ),
                                  Bounce(
                                      duration: const  Duration(milliseconds: 110),
                                      onPressed: (){

                                      },
                                      child:   wIconContainer(Icons.more_vert,Colors.black)
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text("Detail",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                          ],
                        ),
                        Text("${productController.prdetails.value[0]["price"]} AED",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),)
                      ],
                    ),
                  ),

                )

            ),
            Flexible(
              flex: productController.flexValue.value,
              child: Container(
                decoration:   const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bounce( onPressed: (){
                        productController.fnExpandOrnor();

                      },
                          duration: const  Duration(milliseconds: 110),
                          child:  Center(child: Icon(productController.flexValue.value==3? Icons.expand_less_outlined:Icons.expand_more_outlined,color: color1,))),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Bounce(child: wIconContainer(Icons.ios_share_rounded,color1), duration:     const  Duration(milliseconds: 110), onPressed: (){}),
                          const SizedBox(width: 10,),
                          Bounce(
                           duration: const  Duration(milliseconds: 110),
                            onPressed: (){},
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: color1,

                              ),
                              child: const Text("Order Now",style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(productController.prdetails.value[0]["title"],style: const TextStyle(color: Colors.grey,fontSize: 13,fontStyle: FontStyle.italic)),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(productController.prdetails.value[0]["description"],style: const TextStyle(color: Colors.black,fontSize: 12)),
                      const SizedBox(height: 6,),
                      productController.flexValue.value==4? Container(
                        decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey.withOpacity(0.2),),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Reviews (${productController.prdetails.value[0]["rating"]["count"]})"),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(productController.prdetails.value[0]["rating"]["rate"].toString(),style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),),
                                  const SizedBox(width: 20,),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: productController.prdetails.value[0]["rating"]["rate"].toInt(),
                                    itemSize: 17,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ):const SizedBox()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),

        )
    );
  }


  wIconContainer(IconData icon, color){


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10) ,   boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius:5 ,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
      ),
      child:  Icon(icon,color: color,size: 16),
    );
  }
}
