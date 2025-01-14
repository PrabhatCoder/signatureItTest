import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/view_controller/login_controller.dart';

import '../view_controller/widgets_constant/SocialMediaButton.dart';
import '../view_controller/widgets_constant/form_divder.dart';
import '../view_controller/widgets_constant/heading_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/profile.png",width:200,height: 250,),
            
                heading_text(text: "Hi...",),
                SizedBox(height: 4,),
                heading_text(text: "Welcome Back..."),
                SizedBox(height: 4,),
                heading_text(text: "Login Now"),
                SizedBox(height: 24,),
                Form(
                    key: controller.loginKey,
                    child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
            
                        if((value??"").isEmpty){
                          return "Enter Valid Phone Number";
                        }
                        if((value??"").length!=10){
                          return "Enter Valid Phone Number";
                        }
                        return null;
                      },
                      controller: controller.phoneNumber,
                      decoration: InputDecoration(
            
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                          prefixIcon: Icon(
                            Iconsax.mobile,
                          ),
                          labelText: "Mobile Number",),
                    ),
            
                    SizedBox(height: 24,),
            
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
            
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                        onPressed: () {
                          controller.signInPhoneNumber();
                    }, child: Text("Login Now",style: Theme.of(context).textTheme.bodyLarge?.apply(
                      color: Colors.white
                    ),)),
                  ),
            
                    SizedBox(height: 24,),
                    FromDivider(dividerText: "SignIn With"),
                    const SizedBox(height: 8,),
                    const SocialMediaButton()
            
                  ],
            
                ))
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}





