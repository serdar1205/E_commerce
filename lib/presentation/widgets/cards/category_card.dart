import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/domain/entities/category.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../pages/products/products_page.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key,required this.model});
 final CategoryEntity model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductsPage(categoryId: model.id,)));
      //  context.push(RouteNames.productList);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        //  width: 175,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),

        ),
        child: Column(
          children: [
            ///image
            SizedBox(
              width: 175,
              height: 175,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: ApiEndpoints.images + model.icon,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              ),
            ),

            ///body
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: MediumText(model.nameTm??'', context: context),
            ),
          ],
        ),
      ),
    );
  }
}

