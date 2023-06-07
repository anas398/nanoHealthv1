


import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:nanohealth/style/colors.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              const Text('Connection Lost', style: TextStyle(color: Colors.black,fontSize: 15),),
              const Text('Server connection lost, try again', style: TextStyle(color: Colors.black,fontSize: 10),),

            const SizedBox(height: 10,),
              Bounce(
                duration: const Duration(milliseconds: 110),
                onPressed: (){
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 8),
                  decoration:  const BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child:    const Text('Close', style: TextStyle(color: Colors.white,fontSize: 12),),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
