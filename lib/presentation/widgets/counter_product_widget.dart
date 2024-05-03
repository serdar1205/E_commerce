import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/domain/usecases/cart/update_cart_item.dart';
import 'package:tehno_mir/locator.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';
import 'package:tehno_mir/presentation/bloc/cart/total_price/total_price_bloc.dart';

import 'buttons/icon_button.dart';

class CounterProductWidget extends StatefulWidget {
  const CounterProductWidget({
    super.key,
    this.height,
    this.width,
    this.buttonHeight,
    this.buttonWidth,
    required this.textCount,
    required this.id,
    required this.quantity,
  });

  final double? width;
  final double? height;
  final double? buttonHeight;
  final double? buttonWidth;
  final int textCount;
  final int id;
  final int quantity;

  @override
  State<CounterProductWidget> createState() => _CounterProductWidgetState();
}

class _CounterProductWidgetState extends State<CounterProductWidget> {
 late int count;
 late int quantity;
 @override
  void initState() {
    super.initState();
     count = widget.textCount;
     quantity = widget.quantity;
  }
  @override
  Widget build(BuildContext context) {
    print('CounterProductWidget build');
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(9), bottomRight: Radius.circular(9)),
      child: Stack(
        children: [
          Container(
            width: widget.width ?? 100,
            height: widget.height ?? 30,
            color: Colors.white,
            child: Center(
                child:
                    SmallText(count.toString(), context: context)),
          ),
          IconButtonWithRadius(
            iconData: Icons.remove,
            leftPosition: 0,
            topLeftRadius: 9,
            bottomRightRadius: 9,
            buttonHeight: widget.buttonHeight,
            buttonWidth: widget.buttonWidth,
            onTap: () {
              if (count > 0) {
                setState(() {
                  count --;
                });
                print(count);
                context.read<CartBloc>().add(UpdateProductEvent(UpdateCartItemParams(
                    productId: widget.id, count: count)));
                context.read<TotalPriceBloc>().add(GetCartProductsTotalCostEvent());
              }  else{
                print('Ammarda basga yok!');
              }
            },
          ),
          IconButtonWithRadius(
            iconData: Icons.add,
            rightPosition: 0,
            topLeftRadius: 9,
            bottomRightRadius: 9,
            buttonHeight: widget.buttonHeight,
            buttonWidth: widget.buttonWidth,
            onTap: () {
              if (count < quantity) {
                setState(() {
               count ++;
                });
                print(count);
                context.read<CartBloc>().add(UpdateProductEvent(UpdateCartItemParams(
                    productId: widget.id, count: count)));
                context.read<TotalPriceBloc>().add(GetCartProductsTotalCostEvent());
              }  else{
                print('Ammarda basga yok!');
              }

            },
          ),
        ],
      ),
    );
  }
}
