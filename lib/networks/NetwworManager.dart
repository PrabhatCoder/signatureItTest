
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../snack_bar/SnackBar_view.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _conectivityStatus=ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _conectivityStatus.value = result.single;
    if (_conectivityStatus.value == ConnectivityResult.none) {
      SnackBarView.errorSnackBar(title: 'No Internet Connection');
    }
  }

  Future<bool> isConnected() async {

    try{
      final result=await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }else{
        return true;
      }

    }
    on PlatformException catch (_) {
      return false;
    }

  }
  @override
  void onClose() {
    // TODO: implement onClose
    _connectivitySubscription.cancel();
    super.onClose();
  }
}