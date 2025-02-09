import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/bloc/categories/category_cubit.dart';
import 'package:tehno_mir/presentation/widgets/category_title.dart';
import 'package:tehno_mir/presentation/widgets/state_popup/state_popup.dart';
import '../../../core/constants/sizes/app_sizes.dart';
import '../../bloc/products/products_cubit.dart';
import '../../widgets/cards/product_card_grid.dart';
import 'components/banner.dart';
import 'components/categories_title.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  ///  context.read<CategoryCubit>().getCategories();
    context.read<CategoryCubit>().init();
    context.read<CategoryProductsCubit>().init();//getProducts(ProductQueryParameters());
  }

  @override
  Widget build(BuildContext context) {
   //  final categoryCubit = context.read<CategoryCubit>();
   // final productsCubit = context.read<CategoryProductsCubit>();
   //
   //  WidgetsBinding.instance!.addPostFrameCallback((_) {
   //    categoryCubit.getCategories();
   //  });
   //
   //
   //  WidgetsBinding.instance!.addPostFrameCallback((_) {
   //    //productsCubit.getAllProducts();
   //    productsCubit.getProducts(ProductQueryParameters());//ProductQueryParameters(limit: 1,sortBy: 'created_at',order: 'desc'));
   //  });

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const ImageSliderWidget(),
            const Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
            const CategoryTitle(title: 'Kategoriyalar'),
            const Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
            const CategoryChipsWidget(),
          ]),
        ),
        BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            if (state is CategoryProductsLoadingState) {
              return   SliverToBoxAdapter(child: StateRenderer(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
            } else if (state is CategoryProductsLoadedState) {
              return ProductCardGrid(products: state.data);
            } else if (state is CategoryProductsErrorState) {
              return SliverToBoxAdapter(
                child: StateRenderer(stateRendererType: StateRendererType.POPUP_ERROR_STATE,
                  title: state.message,
                  retryActionFunction: (){
                 //   context.read<CategoryProductsCubit>().getProducts(ProductQueryParameters());
                  },
                ),
              );
            } else if (state is CategoryProductsEmptyState) {
              return SliverToBoxAdapter(
                child: Center(
                  child: BigText('Haryt tapylmady', context: context),
                ),
              );
            } else {
              return const SliverToBoxAdapter(child: SizedBox());
            }
          },
        ),
      ],
    );
  }
}

