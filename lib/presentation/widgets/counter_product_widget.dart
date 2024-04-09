import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';

import 'buttons/icon_button.dart';

class CounterProductWidget extends StatelessWidget {
  const CounterProductWidget({super.key, this.height, this.width, this.buttonHeight, this.buttonWidth, this.textWidget});

  final double? width;
  final double? height;
  final double? buttonHeight;
  final double? buttonWidth;
  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(9), bottomRight: Radius.circular(9)),
      child: Stack(
        children: [
          Container(
            width: width ?? 100,
            height: height ?? 30,
            color: Colors.white,
            child: Center(
                child:textWidget ?? SmallText(1.toString(), context: context)),
          ),
          IconButtonWithRadius(
            iconData: Icons.remove,
            leftPosition: 0,
            topLeftRadius: 9,
            bottomRightRadius: 9,
            buttonHeight: buttonHeight,
            buttonWidth: buttonWidth,
            onTap: () {},
          ),
          IconButtonWithRadius(
            iconData: Icons.add,
            rightPosition: 0,
            topLeftRadius: 9,
            bottomRightRadius: 9,
            buttonHeight: buttonHeight,
            buttonWidth: buttonWidth,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
