import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:untitled/view_controller/auth.dart';

import '../networks/NetwworManager.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AuthenticationRepository());

  }

}