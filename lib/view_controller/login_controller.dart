import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/http_helper.dart';
import 'package:untitled/models/LoginReponse.dart';
import 'package:untitled/networks/NetwworManager.dart';
import 'package:untitled/views/dash_board_view.dart';
import 'package:untitled/views/otp_screen.dart';

import '../snack_bar/SnackBar_view.dart';
import 'auth.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> otpFormKey = GlobalKey();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future<void> signInPhoneNumber() async {

    final isConnected= await NetworkManager.instance.isConnected();
    if(!loginKey.currentState!.validate()){
      return;
    }
    if(!isConnected){
    //  PFullScreenLoader.stopLoading();
      return ;
    }

    var data = {"ContactNo": phoneNumber.text.trim()};
    HttpHelper.post("api/M2mg/SendOTP_mobile", data).then(
      (value) {
        LoginReponse loginReponse = LoginReponse.fromJson(value);
        print("otpPrint${value}");

        if ((loginReponse.status ?? false) == true) {

          otpController.text=loginReponse.response?[0].oTP??"";
          print("otpPrint${loginReponse.response?[0].oTP??""}");
          Get.to(OtpScreen());
        } else {
          SnackBarView.errorSnackBar(title: loginReponse.message??"");

        }
      },
    );
  }


  Future<void> googleSignIn() async{
    try{
      //PFullScreenLoader.openLoadingDialog('Logging you in...', '');
      final isConnected= await NetworkManager.instance.isConnected();
      if(!isConnected){
        //PFullScreenLoader.stopLoading();
        return ;
      }
      final userCredentials =await AuthenticationRepository.instance.signInWithGoolge();
      Get.offAll(DashBoardView());
     // print("safnjdbsgh${userCredentials?.additionalUserInfo?.username}");
      await saveUserRecord(userCredentials);




    }catch(e){
      SnackBarView.errorSnackBar(title:'Oh Snap',message: e.toString());
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {



    } catch (e) {
      SnackBarView.errorSnackBar(
          title: 'Data not saved',
          message:
          'Something went wrong while saving your information. You can re-save your Profile.');
    }
  }

  Future<void> verifyNow()async {
    final isConnected= await NetworkManager.instance.isConnected();
    if(!isConnected){
      return;
    }
    if(!otpFormKey.currentState!.validate()){
      return;
    }
    SnackBarView.successSnackBar(title: "Success Full Verify Otp");
    Get.offAll(DashBoardView(),transition: Transition.leftToRight);
  }
}
