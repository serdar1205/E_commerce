import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';

class IconButtonWithRadius extends StatelessWidget {
  const IconButtonWithRadius({
    super.key,
    this.rightPosition,
    this.leftPosition,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.onTap,
    this.bgColor,
    this.iconColor,
    this.buttonWidth,
    this.buttonHeight,
    required this.iconData,
  });

  final double? rightPosition;
  final double? leftPosition;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final void Function()? onTap;
  final IconData iconData;
  final Color? iconColor;
  final Color? bgColor;
  final double? buttonHeight;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: rightPosition,
      left: leftPosition,
      child: ClipRRect(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 0),
          topRight: Radius.circular(topRightRadius ?? 0),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
          bottomRight: Radius.circular(bottomRightRadius ?? 0),


        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
              width:buttonWidth?? 30,
              height:buttonHeight?? 30,
              color:bgColor?? AppColors.curnil,
              child:  Center(
                  child: Icon(
                    iconData,
                    color:iconColor ??AppColors.whiteColor,
                  ))),
        ),
      ),
    );
  }
}
