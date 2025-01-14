import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/view_controller/ApiController.dart';

import '../view_controller/widgets_constant/rounded_images.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ApiController());
    return Obx(
     () =>  Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PRoundedImage(
                  width: MediaQuery.of(context).size.width,
                  height: 250,

                  imageUrl:
                  controller.itemDetails.value.proImage??"https://medicine2mg.com/ProductImages/6386912640000000002df18c40-07cf-432d-9025-0d18f289cce5.jpeg",
                  isNetworkImage: true,
                  applyImageRadius: true,
                  fit: BoxFit.fill,
                ),
                Text("${controller.itemDetails.value.productName}",),
                Text("RegularPrize : ${controller.itemDetails.value.regularPrice}"),
                Text("Sale Prize : ${controller.itemDetails.value.salePrice}"),
                Text("Product Description \n ${controller.itemDetails.value.productSDescription}"),

              ],
            ),
          ),
        ),
       bottomNavigationBar: SizedBox(
         width: MediaQuery.of(context).size.width,
         child: ElevatedButton(
             style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(),
               backgroundColor: Colors.blue,),

             onPressed: () {

         }, child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 16),)),
       ),
      ),
    );
  }
}
