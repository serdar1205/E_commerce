import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/config/route/route_names.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/usecases/product_detail/get_product_detail.dart';
import 'package:tehno_mir/presentation/bloc/auth/auth_bloc.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';
import 'package:tehno_mir/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:tehno_mir/presentation/bloc/product_details/product_detail_bloc.dart';
import 'package:tehno_mir/presentation/pages/product_details/product_details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/strings/endpoints.dart';
import '../../pages/registration/sign_up/registration_page.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.model});

  final ProductEntity model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteNames.productDetailRoute,arguments: model.id);
       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: model.id,)));
        context.read<ProductDetailBloc>().add(GetProductDetailEvent(
            ParamsGetProductDetailUseCase(productId: model.id)));

        // context.push(RouteNames.productDetail);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            //  width: 175,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                ///image
                Stack(
                  children: [
                    SizedBox(
                      width: 175,
                      height: 175,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: CachedNetworkImage(
                          imageUrl: ApiEndpoints.images + model.image!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),

                     /// like
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (BuildContext context, AuthState state) {
                            if (state is AuthLogged) {
                              return _buildFavoriteButton(context, model.id);
                            } else {
                              return _buildUnauthorizedFavoriteButton(context);
                            }
                          },
                        ),
                      ),
                    ),

                    // Positioned(
                    //   top: 0,
                    //   right: 0,
                    //   child: ClipRRect(
                    //     borderRadius: const BorderRadius.only(
                    //         topRight: Radius.circular(8),
                    //         bottomLeft: Radius.circular(12)),
                    //     child: BlocBuilder<AuthBloc, AuthState>(
                    //       builder: (BuildContext context, AuthState state) {
                    //         if (state is AuthLogged) {
                    //          return BlocBuilder<FavoriteBloc, FavoriteState>(
                    //             builder: (context, state) {
                    //               if (!context
                    //                   .read<FavoriteBloc>()
                    //                   .productId
                    //                   .contains(model.id)) {
                    //                 return Container(
                    //                     width: 40,
                    //                     height: 40,
                    //                     color: Colors.white,
                    //                     child: Center(
                    //                         child: IconButton(
                    //                           onPressed: () {
                    //                             context
                    //                                 .read<FavoriteBloc>()
                    //                                 .add(AddFavoriteProduct(model.id));
                    //                           },
                    //                           icon: const Icon(
                    //                             Icons.favorite_border_outlined,
                    //                             color: Colors.red,
                    //                           ),
                    //                         )));
                    //               } else {
                    //                 return Container(
                    //                     width: 40,
                    //                     height: 40,
                    //                     color: Colors.white,
                    //                     child: Center(
                    //                         child: IconButton(
                    //                           onPressed: () {
                    //                             context.read<FavoriteBloc>().add(RemoveFavoriteProduct(model.id));
                    //                           },
                    //                           icon: const Icon(
                    //                             Icons.favorite,
                    //                             color: Colors.red,
                    //                           ),
                    //                         )));
                    //               }
                    //             },
                    //           );
                    //         }
                    //      else {
                    //           return Container(
                    //               width: 40,
                    //               height: 40,
                    //               color: Colors.white,
                    //               child: Center(
                    //                   child: IconButton(
                    //                     onPressed: () {
                    //
                    //                       _showDialog(context, 'Halanlaryma gosmak ucin agza bolun!');
                    //                     },
                    //                     icon: const Icon(
                    //                       Icons.favorite_border,
                    //                       color: Colors.red,
                    //                     ),
                    //                   )));
                    //         }
                    //
                    //       },),
                    //   ),
                    // ),

                    ///discount
                    model.discount == 0
                        ? const SizedBox()
                        : Positioned(
                            bottom: 20,
                            left: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              child: Container(
                                  width: 50,
                                  height: 30,
                                  color: const Color.fromRGBO(253, 81, 68, 1),
                                  child: Center(
                                      child: VerySmallText(
                                    '${model.discount}%',
                                    context: context,
                                  ).copyWith(color: AppColors.whiteColor))),
                            ),
                          ),
                  ],
                ),

                ///body

                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(model.nameTm, context: context),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child:
                            VerySmallText('${model.price}TMT', context: context)
                                .copyWith(isLineThrough: true),
                      ),
                      SmallText('${model.salePrice} TMT', context: context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(12)),
              child: Container(
                  width: 40,
                  height: 40,
                  color: AppColors.curnil,
                  child: Center(child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLogged) {
                        context.read<CartBloc>().add(GetCartProductsEvent());
                        return BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (!context
                                .read<CartBloc>()
                                .addedItemId
                                .contains(model.id)) {
                              return IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddProductEvent(model.id));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Sebede gosuldy'),
                                    duration: Duration(seconds: 1),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                                color: Colors.white,
                              );
                            }

                            else {
                              return IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(RemoveProductEvent(model.id));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Sebetden ayryldy'),
                                    duration: Duration(seconds: 1),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.remove,
                                ),
                                color: Colors.white,
                              );
                            }
                          },
                        );
                      }else {
                        return IconButton(
                        onPressed: () {
                          _showDialog(
                              context, 'Sebede gosmak ucin agza bolun!');
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                        color: Colors.white,
                      );
                      }
                    },
                  ))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, int productId) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (!context.read<FavoriteBloc>().productId.contains(productId)) {
          return _buildFavoriteIconButton(
            onPressed: () {
              context.read<FavoriteBloc>().add(AddFavoriteProduct(productId));
            },
            icon: Icons.favorite_border_outlined,
          );
        } else {
          return _buildFavoriteIconButton(
            onPressed: () {
              context.read<FavoriteBloc>().add(RemoveFavoriteProduct(productId));
            },
            icon: Icons.favorite,
          );
        }
      },
    );
  }
  Widget _buildFavoriteIconButton({required VoidCallback onPressed, required IconData icon}) {
    return Container(
      width: 40,
      height: 40,
      color: Colors.white,
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
  Widget _buildUnauthorizedFavoriteButton(BuildContext context) {
    return _buildFavoriteIconButton(
      onPressed: () {
        _showDialog(context, 'Halanlaryma gosmak ucin agza bolun!');
      },
      icon: Icons.favorite_border,
    );
  }
  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //backgroundColor: AppColors.cardColor3,
        elevation: 8,
        content: BigText(title, context: context),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MediumText(
                  'Yok',
                  context: context,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteNames.registerRoute);
                  //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));
                },
                child: MediumText(
                  'Agza bolmak',
                  context: context,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
