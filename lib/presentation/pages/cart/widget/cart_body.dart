import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/widgets/buttons/icon_container_button.dart';
import 'package:tehno_mir/presentation/widgets/counter_product_widget.dart';

class BasketBody extends StatefulWidget {
  const BasketBody({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);
  final String image, title;
  final int price;
  final VoidCallback press;
  @override
  State<BasketBody> createState() => _BasketBodyState();
}
class _BasketBodyState extends State<BasketBody> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      height: 176,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ///image
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: SizedBox(
              height: 160,
              width: 120,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ///body
          SizedBox(
            width: MediaQuery.of(context).size.width - 195,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      widget.title,
                      context: context,
                      maxLine: 2,
                    ),
                    const SizedBox(width: 5),
                    IconBackgroundButton(
                      icon: 'delete.svg',
                      onTap: () {},
                    )
                  ],
                ),
                ///category
                SmallText(
                  widget.title,
                  context: context,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: SmallText(
                        "${widget.price} TMT",
                        context: context,
                      ),
                    ),
                    /// count
                    const CounterProductWidget(),
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
