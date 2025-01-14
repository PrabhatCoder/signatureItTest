import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/view_controller/login_controller.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {
              controller.googleSignIn();
            },
            icon: const Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/images/google.png"),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/images/profile.png"),
            ),
          ),
        ),
      ],
    );
  }
}
