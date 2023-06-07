import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:nanohealth/controller/loginController.dart';
import 'package:nanohealth/style/colors.dart';
import 'package:nanohealth/views/product.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Flexible(flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    color1,
                    color2,
                  ],
                ),
                    image: DecorationImage(image: AssetImage("assets/images/appicon.png"))
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(""),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("Log In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                    )
                  ],
                ),

                ),
              ),
         Obx(() =>  Flexible(
           flex: 6, child: Padding(
           padding: const EdgeInsets.all(28.0),
           child: Column(
             children: [

               TextFormField(
                 controller: loginController.txtEmail,
                 decoration: const InputDecoration(
                     label: Text("Email",style: TextStyle(color: Colors.black)),
                     suffixIcon: Icon(Icons.check_circle_outline ,color: color1,size: 17,)
                 ),

               ),
               const SizedBox(height: 25,),
               TextFormField(
                 controller: loginController.txtPassword,
                 obscuringCharacter: "*",
                 obscureText: loginController.passwordVisible.value,
                 decoration:  InputDecoration(
                   label: Text("Password",style: TextStyle(color: Colors.black)),
                   suffixIcon: GestureDetector(
                       onTap: loginController.fnVisible,
                       child: Icon(  loginController.passwordVisible.value
                           ? Icons.visibility_outlined
                           : Icons.visibility_off_outlined,
                         color:  loginController.passwordVisible.value?Colors.grey: color1,
                         size: 17,)),

                 ),

               ),
               const SizedBox(height: 20,),
           Bounce(
             duration: const  Duration(milliseconds: 110),
                 onPressed: (){
                   loginController.fnLogin();

                 },
                 child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 90,vertical: 16),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                     color: color1,


                   ),
                   child: Text("Continue",style: TextStyle(color: Colors.white)),
                 ),
               ),
               const SizedBox(height: 24,),
               Text("NEED HELP?")
             ],
           ),
         ),))


        ],
      ),


    );
  }
}
