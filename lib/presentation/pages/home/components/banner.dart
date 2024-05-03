
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/sizes/app_text_size.dart';
import '../../../bloc/banners/banner_cubit.dart';
import '../../../widgets/carousel_slider.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({
    super.key,
  });

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  @override
  void initState() {
    super.initState();
   context.read<BannerCubit>().getBanners();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerLoadingState) {
          return Container(
            margin:  const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          );
        } else if (state is BannerLoadedState) {
          return CarouselSliderImage(images: state.data);
        } else if (state is BannerErrorState) {
          return Center(
            child: BigText(state.message, context: context),
          );
        } else if (state is BannerEmptyState) {
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