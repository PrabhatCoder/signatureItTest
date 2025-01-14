import 'package:flutter/material.dart';

class PCircularContainer extends StatelessWidget {
  PCircularContainer({
    super.key,this.borderColor=Colors.grey, this.width, this.height, this.radius, this.padding, this.child, this.backgroundColor, this.margin, this.showBorder=false,
  });

  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  final Color? backgroundColor;
  Color? borderColor;
  final bool? showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          border:showBorder! ? Border.all(color: borderColor!):null,
          color: backgroundColor
      ),
      child: child,
    );
  }
}