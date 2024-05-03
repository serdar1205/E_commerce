
import 'package:flutter/material.dart';
import 'package:tehno_mir/presentation/widgets/cards/product_card.dart';

import '../../../domain/entities/product/product.dart';

class ProductCardGrid extends StatelessWidget {
  const ProductCardGrid({
    super.key, required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 0.65),
      delegate: SliverChildBuilderDelegate(
        childCount: products.length,
            (BuildContext context, int index) {
          return  ProductCardWidget(model: products[index]);
        },
      ),
    );
  }
}
