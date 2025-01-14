
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/view_controller/widgets_constant/rounded_images.dart';

import '../../views/product_detail_screen.dart';
import 'circle_container.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {


     final verticalProductShadow=BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        blurRadius: 50,
        spreadRadius: 7,
        offset:const Offset(0,2)
    );

    return GestureDetector(
      onTap: () {
        Get.to(const ProductDetails());
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [verticalProductShadow],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white),
        child:  Column(
          children: [
            PCircularContainer(
              radius: 12,
              height: 180,
              padding: const EdgeInsets.all( 8),
              child: Stack(
                children: [
                  const   PRoundedImage(
                    imageUrl:
                    "https://i.pinimg.com/564x/83/c6/9e/83c69e7564ccdb31f2f4177e9d8a6464.jpg",
                    isNetworkImage: true,
                    applyImageRadius: true,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 12,
                    child: PCircularContainer(

                      radius: 12,
                      padding: const EdgeInsets.symmetric(horizontal:8,vertical: 12),
                      backgroundColor: Colors.blue.withOpacity(0.8),
                      child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: Colors.black
                      )),
                    ),
                  ),
                  // const Positioned(
                  //     top: 0,
                  //     right: 0,
                  //     child: CircleIcon(icon: Iconsax.heart5,color: Colors.red,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Green Nike Air Shoes", textAlign: TextAlign.left, maxLines: 2,),
                  const  SizedBox(
                    height:8,
                  ),
                  // Row(
                  //   children: [
                  //     Text('Nike',overflow: TextOverflow.ellipsis,maxLines: 1,style: Theme.of(context).textTheme.labelMedium,)
                  //     , const  SizedBox(
                  //       height: PSize.xs,
                  //     ),
                  //     const Icon(Iconsax.verify5,color: PColor.primaryColor,size: PSize.iconsXs,),
                  //
                  //
                  //   ],
                  // ),
                  //
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const PProductPrizeText(price: "35.0"),
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //           color: PColor.dark,
                  //           borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(PSize.cardRadiusMd),bottomRight:  Radius.circular(PSize.productImageRadius)
                  //           )
                  //       ),
                  //       child: const SizedBox(
                  //         height: PSize.iconsLg * 1.2,
                  //         width: PSize.iconsLg * 1.2,
                  //         child: Center(
                  //           child: Icon(
                  //             Iconsax.add,color: PColor.white,
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}