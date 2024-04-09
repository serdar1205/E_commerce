import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/domain/entities/product_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselBloc extends Cubit<int> {
  CarouselBloc() : super(0);

  void updateCurrentIndex(int index) => emit(index);
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.images});

  final List<ProductImage> images;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselBloc(),
      child: BlocBuilder<CarouselBloc, int>(
        builder: (context, state) {
          return CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  margin: const EdgeInsets.all(7),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: CachedNetworkImage(
                    imageUrl: ApiEndpoints.images + images[itemIndex].image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>  Container(
                      margin:  const EdgeInsets.symmetric(horizontal: 20),
                      //width: MediaQuery.of(context).size.width,
                      color: Colors.black12,
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  context.read<CarouselBloc>().updateCurrentIndex(index);
                },
                height: MediaQuery.of(context).size.height * 0.35,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ));
        },
      ),
    );
  }
}
