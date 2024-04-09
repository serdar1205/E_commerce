import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/widgets/cards/product_card.dart';
import 'package:tehno_mir/presentation/widgets/cards/product_card_grid.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).appBarTheme.backgroundColor,),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.75),
            delegate: SliverChildBuilderDelegate(
              childCount: 8,
                  (BuildContext context, int index) {
                return Container();//const ProductCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
