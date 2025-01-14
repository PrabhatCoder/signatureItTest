import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/view_controller/ApiController.dart';
import 'package:untitled/views/product_detail_screen.dart';

import '../view_controller/widgets_constant/circle_container.dart';
import '../view_controller/widgets_constant/rounded_images.dart';
import '../view_controller/widgets_constant/vertical_card_view.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =Get.put(ApiController());

    final verticalProductShadow=BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        blurRadius: 50,
        spreadRadius: 7,
        offset:const Offset(0,2)
    );


    return Obx(
      () =>  Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Dashboard"),
        ),
          body:  GridView.builder(

              itemCount:controller.list!=null? controller.list.length:10,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150, crossAxisCount: 2, crossAxisSpacing: 1),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print("asnhjbschj${index}");
                    controller.onItemClick(index);
                    Get.to(const ProductDetails());
                  },
                  child: Container(
                    width: 180,
                    margin: EdgeInsets.all(8),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        boxShadow: [verticalProductShadow],
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child:  Column(
                      children: [
                        PCircularContainer(
                          radius: 12,

                          padding: const EdgeInsets.all( 8),
                          child: PRoundedImage(
                            height: 50,

                            imageUrl:
                            controller.list.value[index].cotegoryImage??"",
                            isNetworkImage: true,
                            applyImageRadius: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(controller.list[index].rootCategoryName??"", textAlign: TextAlign.left, maxLines: 2,),

                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
