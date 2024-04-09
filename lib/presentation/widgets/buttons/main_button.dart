import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';

class MainButton extends StatelessWidget {

  const MainButton({super.key,
    this.buttonTile,
    this.buttonColor,
    this.width,
    this.height,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.onPressed,
  });

  final String? buttonTile;
  final Color? buttonColor;
  final double? width;
  final double? height;

  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: width,
      height: height,//MediaQuery.of(context).size.width /2,
      //   color: Colors.white,
      child: ClipRRect(

        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 0),
          topRight: Radius.circular(topRightRadius ?? 0),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
          bottomRight: Radius.circular(bottomRightRadius ?? 0),


        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(  AppColors.curnil),
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child:BigText(buttonTile ?? '',context: context,).copyWith(color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }


}
