import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/domain/entities/category.dart';
import 'package:tehno_mir/domain/usecases/products/get_category_products_usecase.dart';
import 'package:tehno_mir/presentation/bloc/products/products_cubit.dart';
import 'buttons/filter_button.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key, required this.items, required this.isSearch});

  final List<CategoryEntity> items;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilterButton(
                element: items[index].nameTm,
                press: () {
                  context.read<CategoryProductsCubit>().getCategoryProducts(CategoryProductsQueryParams(categoryId: items[index].id));
                },
                isSearch: isSearch,
              ),
            );
          }),
    );
  }
}

//typedef FilterChanged = Function(HashTag attribute, bool isSelected);
