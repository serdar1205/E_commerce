import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tehno_mir/core/config/route/route_names.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/pages/cart/order_page.dart';
import 'package:tehno_mir/presentation/pages/cart/widget/cart_body.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';

class CartPageModel extends StatelessWidget {
   const CartPageModel({super.key, required this.image, required this.itemCount, required this.title, required this.price, required this.totalPrice, required this.onTap});

  final List<String> image;
  final int itemCount;
  final List<String> title;
  final List<int> price;
  final int totalPrice;
 final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.67,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return BasketBody(
                  image: image[index],
                  title: title[index],
                  price: price[index],
                  press: onTap,
                );
              }),
        ),
        Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SmallText('Jemi baha:', context: context),
                    const SizedBox(height: 5),
                    MediumText('$totalPrice TMT', context: context),
                  ],
                ),
                MainButton(
                  onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const OrderPage()));
                   // context.push(RouteNames.order);
                  },
                  buttonTile: 'Sargydy etmek',
                  topLeftRadius: 15,
                  bottomRightRadius: 15,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ],
            ))
      ],
    );
  }
}
