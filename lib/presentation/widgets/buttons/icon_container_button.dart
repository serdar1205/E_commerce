import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';

class IconBackgroundButton extends StatelessWidget {
  const IconBackgroundButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      /// color: AppColors.appBarColor, //heme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        splashColor: Theme.of(context).cardColor,
        child: Container(
          color: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(6),
          child: SvgPicture.asset('assets/icons/$icon',height: 24,width: 24,),
        ),
      ),
    );
  }
}