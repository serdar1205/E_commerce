import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/domain/entities/product_detail.dart';

class DetailsData extends StatelessWidget {
  const DetailsData({super.key, required this.product});

  final ProductDetailEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: BigText(
              product.nameTm ?? '',
              context: context,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: MediumText(
              product.category,
              context: context,
            ),
          ),
          Row(
            children: [
              BigText(
                product.salePrice.toString(),
                context: context,
              ),
              const SizedBox(width: 20),
              product.discount == 0 ? const SizedBox():     BigText(
                product.price.toString(),
                context: context,
              ).copyWith(isLineThrough: true,color: AppColors.textGrayColor,fontSize: 16),
              const SizedBox(width: 20),
              product.discount == 0
                  ? const SizedBox()
                  : Container(
                      height: 25,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.curnil,
                          borderRadius: BorderRadius.circular(5)),
                      child: VerySmallText(
                        '${product.discount}%',
                        context: context,
                      ).copyWith(color: AppColors.whiteColor),
                    )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            color: AppColors.textGrayColor,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: BigText(
              product.descTm ?? '',
              context: context,
            ).copyWith(fontWeight: FontWeight.w300,fontSize: 19),
          ),
        ],
      ),
    );
  }
}
