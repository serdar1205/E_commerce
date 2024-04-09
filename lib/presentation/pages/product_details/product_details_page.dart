import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tehno_mir/presentation/bloc/product_details/product_detail_bloc.dart';
import 'package:tehno_mir/presentation/pages/product_details/widgets/carousel_slider.dart';
import 'package:tehno_mir/presentation/pages/product_details/widgets/details_data.dart';
import 'package:tehno_mir/presentation/widgets/loadin_widget.dart';
import '../../../core/constants/sizes/app_text_size.dart';
import 'widgets/bottom_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return const Center(
              child: LoadingWidget(),
            );
          } else if (state is ProductDetailLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.81,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        CarouselSliderWidget(
                          images: state.data.images,
                        ),
                        DetailsData(
                          product: state.data,
                        )
                      ],
                    ),
                  ),
                  BottomWidget(
                    countPrice: 125,
                    count: 1,
                    onTap: _showToast,
                  ),
                ],
              ),
            );
            //   ProductDetailsModel(
            //   imageSlider: CarouselSliderWidget(
            //     images: state.data.images,
            //   ),
            //   productData: DetailsData(
            //     product: state.data,
            //   ),
            //   bottomWidget: BottomWidget(
            //     countPrice: 125,
            //     count: 1,
            //     onTap: _showToast,
            //   ),
            // );
          } else if (state is ProductDetailErrorState) {
            return Center(
              child: BigText(state.message, context: context),
            );
          } else if (state is ProductDetailEmptyState) {
            return Center(
              child: BigText('Haryt tapylmady', context: context),
            );
          }
          return Center(
            child: BigText('Error occurred', context: context),
          );
        },
      ),
    );
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: addCartToastColor,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(44, 218, 82, 0.2),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(0, 0))
          ]),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            // color: bgColor5,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            "Added to cart successfully",
          ),
        ],
      ),
    );

    fToast!.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
