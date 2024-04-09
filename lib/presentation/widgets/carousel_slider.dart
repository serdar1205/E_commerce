import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/domain/entities/banners.dart';
import '../../core/constants/strings/endpoints.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CarouselBloc extends Cubit<int> {
  CarouselBloc() : super(0);

  void updateCurrentIndex(int index) => emit(index);
}
class CarouselSliderImage extends StatelessWidget {
  final List<BannerEntity> images;

  const CarouselSliderImage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselBloc(),
      child: BlocBuilder<CarouselBloc, int>(
        builder: (context, currentIndexOfSlider) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    context.read<CarouselBloc>().updateCurrentIndex(index);
                  },
                  height: 200.0,
                  aspectRatio: 9 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                     child: CachedNetworkImage(
                      imageUrl: ApiEndpoints.images + images[itemIndex].imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>  Container(
                        margin:  const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black12,
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((url) {
                  int index = images.indexOf(url);
                  return Container(
                    width: currentIndexOfSlider == index ? 15 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currentIndexOfSlider == index ? Colors.black12 : Colors.black38,
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}