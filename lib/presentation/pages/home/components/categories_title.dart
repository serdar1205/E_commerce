import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/presentation/bloc/categories/category_cubit.dart';

import '../../../../core/constants/sizes/app_text_size.dart';
import '../../../widgets/filter_chips.dart';

class CategoryChipsWidget extends StatelessWidget {
  const CategoryChipsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final categoryCubit = context.read<CategoryCubit>();
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   categoryCubit.getCategories();
    // });
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const SizedBox();
        } else if (state is CategoryLoadedState) {
          return  FilterChips(items: state.data, isSearch: false);
        } else if (state is CategoryErrorState) {
          return Container();
        } else if (state is CategoryEmptyState) {
          return Center(
            child: BigText('Bos', context: context),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}