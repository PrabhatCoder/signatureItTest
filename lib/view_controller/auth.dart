import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';


import '../views/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
  }





  //google authentication login

  Future<UserCredential?> signInWithGoolge() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseException catch (e) {
      throw "${FirebaseException(plugin: e.code).message}";
    } on FormatException catch (e) {
      throw "${PlatformException(code: e.message)}";
    } on PlatformException catch (e) {
      throw "${PlatformException(code: e.code).message}";
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

/*logout*/
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw 'Something Went Wrong. Please try again';
    } on FirebaseException catch (e) {
      throw 'Something Went Wrong. Please try again';
    } on FormatException catch (e) {
      throw 'Something Went Wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'Something Went Wrong. Please try again';
    } catch (e) {
      throw 'Something Went Wrong. Please try again';
    }
  }






}