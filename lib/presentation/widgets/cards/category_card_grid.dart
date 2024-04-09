// import 'package:flutter/material.dart';
// import 'package:tehno_mir/domain/entities/category.dart';
// import 'category_card.dart';
//
// class CategoryCardGrid extends StatelessWidget {
//   const CategoryCardGrid({
//     super.key,
//     required this.model
//   });
//  final List<CategoryEntity> model;
//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 4.0,
//           crossAxisSpacing: 4.0,
//           childAspectRatio: 0.82),
//       delegate: SliverChildBuilderDelegate(
//         childCount: model.length,
//             (BuildContext context, int index) {
//           return  CategoryCardWidget(model: model[index],);
//         },
//       ),
//     );
//   }
// }
