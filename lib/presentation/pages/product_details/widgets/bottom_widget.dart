import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/widgets/buttons/icon_button.dart';
import 'package:tehno_mir/presentation/widgets/counter_product_widget.dart';

class BottomWidget extends StatelessWidget {
   BottomWidget({super.key, this.onTap,required this.countPrice, required this.count});

  void Function()? onTap;
  int countPrice;
  int count;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: const BoxDecoration(
          //color: bgColor5,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(0, 0))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: MediumText('$countPrice TMT', context: context),
            ),
            Stack(
              children: [
                IconButtonWithRadius(
                  iconData: Icons.save_alt_outlined,
                  topLeftRadius: 15,
                  bottomRightRadius: 15,
                  iconColor: AppColors.curnil,
                  bgColor: AppColors.whiteColor,
                  buttonWidth: 40,
                  buttonHeight: 40,
                  onTap: () {},
                ),
              ],
            ),
            CounterProductWidget(
              height: 40,
              width: 145,
              buttonHeight: 40,
              buttonWidth: 40,
              textWidget: BigText(count.toString(), context: context),
            ),
          ],
        ),
      ),
    );
  }
}
