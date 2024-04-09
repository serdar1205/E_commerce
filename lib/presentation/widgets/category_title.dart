import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/sizes/app_sizes.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';

class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
          top: AppSizes.sidePadding, left: AppSizes.sidePadding),
      child: VeryBigText(title,context: context),
    );
  }
}
