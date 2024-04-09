import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/pages/cart/order_page.dart';
import 'package:tehno_mir/presentation/pages/cart/page/cart_page_model.dart';
import 'package:tehno_mir/presentation/pages/cart/widget/cart_body.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CartPageModel(
        image: const ['assets/images/images.jpg','assets/images/images.jpg'],
        itemCount: 2,
        title: const ['title','title'],
        price: const [123,321],
        totalPrice: 1123,
        onTap: () {});
  }
}
