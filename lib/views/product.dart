import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nanohealth/controller/productController.dart';
import 'package:nanohealth/style/colors.dart';
import 'package:nanohealth/views/ProductDetailScreen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductController productController = Get.put(ProductController());
  @override
  void initState() {
   Future.delayed(const Duration(
     seconds: 2
   ),() =>   productController.fnProduct(),
   );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
          shadowColor: Colors.grey.withOpacity(0.2),
          bottomOpacity: 3.0,
          elevation: 3.8,
          title: const Text("All Products", style: TextStyle(color: Colors.black)),
        ),
        body: Obx(() => productController.productList.value.isEmpty?const Center(
          child: CircularProgressIndicator(color: color1),
        ) :Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child:ListView.builder(
                itemCount: productController.productList.length,
                itemBuilder: (context,index){
                  var title = productController.productList[index]["title"];
                  var price = productController.productList[index]["price"];
                  var desc = productController.productList[index]["description"];
                  var category = productController.productList[index]["category"];
                  var image = productController.productList[index]["image"];
                  var rating_rate = productController.productList[index]["rating"]["rate"];
                  var rating_count = productController.productList[index]["rating"]["count"];

                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Bounce(
                      duration: const  Duration(milliseconds: 110),
                      onPressed: (){
                        Get.to( ProductDetailScreen(id: productController.productList[index]["id"],));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            decoration:  BoxDecoration(
                              color: color1,
                              borderRadius:  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  opacity: 1,fit: BoxFit.fill,
                                  image: NetworkImage(image)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(""),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${price.toString()} AED",
                                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                        RatingBar.builder(
                                          initialRating: 5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: rating_rate.toInt(),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(title.toString(),style: const TextStyle(color: Colors.grey,fontSize: 13,fontStyle: FontStyle.italic)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(desc.toString(),style: const TextStyle(color: Colors.black,fontSize: 12))
                        ],
                      ),
                    ),
                  );
                })
        ),


        ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(showSelectedLabels: false,
            showUnselectedLabels: false,




            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(backgroundColor: Colors.white,

                icon: Icon(Icons.menu,color: Colors.grey),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined,color: Colors.grey),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken_sharp,color: Colors.grey),
                label: 'Chats',
              ),  BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined,color: Colors.grey),
                label: 'Chats',
              ),

            ],
          ),
        ),
      ),

    );
  }
}
