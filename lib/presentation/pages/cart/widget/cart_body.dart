import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';
import 'package:tehno_mir/presentation/widgets/buttons/icon_container_button.dart';
import 'package:tehno_mir/presentation/widgets/counter_product_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/strings/endpoints.dart';

class CartItemBody extends StatelessWidget {
  const CartItemBody({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.totalPrice,
    required this.discount,
    required this.category,
    required this.discountPrice,
    required this.itemCount,
    required this.productId,
    required this.quantity,
  }) : super(key: key);
  final String image, title;
  final int price;
  final VoidCallback press;

  final int itemCount;
  final double totalPrice;
  final int discount;
  final String category;
  final double discountPrice;
  final int productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    print('CartItemBody');
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      height: 176,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ///image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: SizedBox(
                  height: 160,
                  width: 120,
                  child: CachedNetworkImage(
                    imageUrl: ApiEndpoints.images + image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              discount == 0
                  ? const SizedBox()
                  : Positioned(
                      bottom: 20,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        child: Container(
                            width: 50,
                            height: 30,
                            color: const Color.fromRGBO(253, 81, 68, 1),
                            child: Center(
                                child: VerySmallText(
                              '$discount%',
                              context: context,
                            ).copyWith(color: AppColors.whiteColor))),
                      ),
                    ),
            ],
          ),
          const SizedBox(width: 10),

          ///body
          SizedBox(
            width: MediaQuery.of(context).size.width - 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      title,
                      context: context,
                      maxLine: 2,
                    ),
                    const SizedBox(width: 5),
                    IconBackgroundButton(
                      icon: 'delete.svg',
                      onTap: () {
                        context.read<CartBloc>().add(RemoveProductEvent(productId));
                      },
                    )
                  ],
                ),

                ///category
                SmallText(
                  category,
                  context: context,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      "$discountPrice TMT",
                      context: context,
                    ),
                    SmallText(
                      "$price TMT",
                      context: context,
                    ).copyWith(
                        isLineThrough: true, color: AppColors.textGrayColor),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: SmallText(
                        "${totalPrice.toStringAsFixed(2)} TMT",
                        context: context,
                      ),
                    ),

                    /// count
                    CounterProductWidget(
                      textCount: itemCount,
                      id: productId,
                      quantity: quantity,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
