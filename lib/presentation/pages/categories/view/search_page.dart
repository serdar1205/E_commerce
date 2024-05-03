import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/bloc/categories/category_cubit.dart';
import '../../../widgets/cards/category_card.dart';
import '../../../widgets/loadin_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const SliverFillRemaining(
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            } else if (state is CategoryLoadedState) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.82,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return CategoryCardWidget(model: state.data[index]);
                  },
                  childCount: state.data.length,
                ),
              );
            } else if (state is CategoryErrorState) {
              return SliverFillRemaining(
                child: Center(
                  child: BigText(state.message, context: context),
                ),
              );
            } else if (state is CategoryEmptyState) {
              return SliverFillRemaining(
                child: Center(
                  child: BigText('Bos', context: context),
                ),
              );
            } else {
              return const SliverFillRemaining(
                child: SizedBox(),
              );
            }
          },
        ),
      ],
    );
    //   SearchPageModel(
    //   hashTags: hashTags,
    //   searchResultTitle: '1 haryt tapyldy',
    //   gridView: Container()//ProductCardGrid(),
    // );
  }
}
