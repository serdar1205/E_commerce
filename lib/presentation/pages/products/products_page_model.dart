// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tehno_mir/core/constants/sizes/app_sizes.dart';
// import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
// import 'package:tehno_mir/presentation/widgets/filter_chips.dart';
//
// import '../../bloc/category_products/products_cubit.dart';
// import '../../widgets/cards/product_card_grid.dart';
//
// class ProductsPageModel extends StatelessWidget {
//   ProductsPageModel(
//       {super.key,
//       required this.hashTags,
//       required this.searchResultTitle,
//       this.onTap});
//
//   String searchResultTitle;
//   List<String> hashTags;
//
//   // final Widget gridView;
//   void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           actions: [
//             IconButton(onPressed: onTap, icon: const Icon(Icons.sort)),
//           ],
//         ),
//         body: CustomScrollView(
//           slivers: [
//             SliverList(
//                 delegate: SliverChildListDelegate([
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 10),
//                 child: MediumText(
//                   searchResultTitle,
//                   context: context,
//                 ),
//               ),
//               const Padding(
//                   padding: EdgeInsets.only(top: AppSizes.sidePadding)),
//               FilterChips(
//                 items: [],
//                 isSearch: true,
//               ),
//             ])),
//             BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
//               builder: (context, state) {
//                 if (state is CategoryProductsLoadingState) {
//                   return const SizedBox();
//                 } else if (state is CategoryProductsLoadedState) {
//                   return ProductCardGrid(
//                     products: state.data,
//                   );
//                 } else if (state is CategoryProductsErrorState) {
//                   return Center(
//                     child: BigText(state.message, context: context),
//                   );
//                 } else if (state is CategoryProductsEmptyState) {
//                   return Center(
//                     child: BigText('Bos', context: context),
//                   );
//                 } else {
//                   return const SizedBox();
//                 }
//               },
//             ),
//           ],
//         ));
//   }
// }
