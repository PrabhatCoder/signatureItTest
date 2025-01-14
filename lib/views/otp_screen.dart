import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/view_controller/login_controller.dart';

import '../view_controller/widgets_constant/heading_view.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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

                heading_text(text: "Verify Now"),
                SizedBox(height: 24,),
                Form(
                    key: controller.otpFormKey,
                    child: Column(
                      children: [
                        GetBuilder<LoginController>(
                          builder: (controller) {
                            return TextFormField(
                              validator: (value) {

                                if((value??"").isEmpty){
                                  return "Enter Valid Otp Number";
                                }
                                return null;
                              },
                              controller: controller.otpController,
                              decoration: InputDecoration(

                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                prefixIcon: Icon(
                                  Iconsax.mobile,
                                ),
                                labelText: "Otp",),
                            );
                          },
                        ),

                        SizedBox(height: 24,),

                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(

                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                              onPressed: () {
                                controller.verifyNow();
                              }, child: Text("Verify Now",style: Theme.of(context).textTheme.bodyLarge?.apply(
                              color: Colors.white
                          ),)),
                        ),



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





