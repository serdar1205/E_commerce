import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:tehno_mir/presentation/widgets/cards/product_card.dart';
import 'package:tehno_mir/presentation/widgets/cards/product_card_grid.dart';
import 'package:tehno_mir/presentation/widgets/loadin_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const SliverFillRemaining(
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            } else if (state is FavoriteLoaded) {
              return ProductCardGrid(products: state.data);
              //   SliverGrid(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 4.0,
              //     crossAxisSpacing: 4.0,
              //     childAspectRatio: 0.75,
              //   ),
              //   delegate: SliverChildBuilderDelegate(
              //         (BuildContext context, int index) {
              //       return CategoryCardWidget(model: state.data[index]);
              //     },
              //     childCount: state.data.length,
              //   ),
              // );
            } else if (state is FavoriteError) {
              return SliverFillRemaining(
                child: Center(
                  child: BigText(state.message, context: context),
                ),
              );
            } else if (state is FavoriteEmpty) {
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
  }
}
