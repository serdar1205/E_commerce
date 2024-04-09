import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_sizes.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/domain/usecases/products/get_category_products_usecase.dart';
import 'package:tehno_mir/presentation/widgets/cards/product_card_grid.dart';
import '../../bloc/products/products_cubit.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  void initState() {
    super.initState();
    context.read<CategoryProductsCubit>().getCategoryProducts(
        CategoryProductsQueryParams(categoryId: widget.categoryId));
  }
  @override
  Widget build(BuildContext context) {
    // final categoryCubit = context.read<CategoryProductsCubit>();
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   categoryCubit.getCategoryProducts(
    //       CategoryProductsQueryParams(categoryId: widget.categoryId));
    // });

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
                onPressed: _openOrderByPrice, icon: const Icon(Icons.sort)),
          ],
        ),
        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            if (state is CategoryProductsLoadingState) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (state is CategoryProductsLoadedState) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: MediumText(
                        '${state.data.length} haryt tapyldy',
                        context: context,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                  ])),
                  ProductCardGrid(products: state.data),
                ],
              );
            } else if (state is CategoryProductsErrorState) {
              return Center(
                child: BigText(state.message, context: context),
              );
            } else if (state is CategoryProductsEmptyState) {
              return Center(
                child: BigText('Haryt tapylmady', context: context),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  void _openOrderByPrice() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 500,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text("Tertiplemek"),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RadioListTile<String>(
                    title: const Text('Asyl tertipde'),
                    value: context.read<CategoryProductsCubit>().values.first,
                    groupValue:
                        context.read<CategoryProductsCubit>().selectedValue,
                    onChanged: (value) {
                      context
                          .read<CategoryProductsCubit>()
                          .updateSelectedValue(value);
                      context.read<CategoryProductsCubit>().getCategoryProducts(
                          CategoryProductsQueryParams(
                              categoryId: widget.categoryId, sortBy: value));
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RadioListTile<String>(
                    title: const Text('Arzandan gymmada'),
                    value: context.read<CategoryProductsCubit>().values[1],
                    groupValue:
                        context.read<CategoryProductsCubit>().selectedValue,
                    onChanged: (value) {
                      context
                          .read<CategoryProductsCubit>()
                          .updateSelectedValue(value);

                      context.read<CategoryProductsCubit>().getCategoryProducts(
                          CategoryProductsQueryParams(
                              categoryId: widget.categoryId,
                              order: value,
                              sortBy: 'price'));
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RadioListTile<String>(
                    title: const Text('Gymmatdan arzana'),
                    value: context.read<CategoryProductsCubit>().values.last,
                    groupValue:
                        context.read<CategoryProductsCubit>().selectedValue,
                    onChanged: (value) {
                      context
                          .read<CategoryProductsCubit>()
                          .updateSelectedValue(value);

                      context.read<CategoryProductsCubit>().getCategoryProducts(
                          CategoryProductsQueryParams(
                              categoryId: widget.categoryId,
                              order: value,
                              sortBy: 'price'));
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
