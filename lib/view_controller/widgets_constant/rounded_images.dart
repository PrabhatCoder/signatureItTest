import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PRoundedImage extends StatelessWidget {
  const PRoundedImage(
      {
        super.key, this.localImage ,this.width, this.height, required this.imageUrl,
        this.applyImageRadius=true, this.border,  this.backgroundColor=Colors.white,
        this.padding,  this.isNetworkImage=false, this.onPressed, this.fit,  this.borderRadius=12,
      });

  final double? width,height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final  String? localImage;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:  EdgeInsets.all(12),
        child: Container(
          width: width,
          height: height,
          padding: padding,

          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: ClipRRect(
            borderRadius:applyImageRadius ? BorderRadius.circular(borderRadius):BorderRadius.zero,

            child:  Image(
              fit: fit,

              image: isNetworkImage ? NetworkImage(imageUrl) as ImageProvider :  AssetImage(localImage!,),
            ),
          ),

        ),
      ),
    );
  }
}