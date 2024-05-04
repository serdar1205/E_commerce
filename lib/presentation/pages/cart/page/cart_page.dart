import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/bloc/auth/auth_bloc.dart';
import 'package:tehno_mir/presentation/bloc/cart/total_price/total_price_bloc.dart';
import 'package:tehno_mir/presentation/pages/cart/order_page.dart';
import 'package:tehno_mir/presentation/pages/cart/widget/cart_body.dart';
import 'package:tehno_mir/presentation/pages/registration/sign_up/registration_page.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('CartPage');
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLogged) {
          context.read<CartBloc>().add(GetCartProductsEvent());
          return BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CartEmptyState) {
                return Center(
                  child: BigText(
                    'Sebet bos',
                    context: context,
                  ),
                );
              } else if (state is CartLoadedState) {
                context
                    .read<TotalPriceBloc>()
                    .add(GetCartProductsTotalCostEvent());
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MediumText(
                        'Sebetdaki harytlaryn sany: ${state.data.cart.length}',
                        context: context),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: state.data.cart.length,
                          itemBuilder: (context, index) {
                            return CartItemBody(
                              image: state.data.cart[index].product.image!,
                              title: state.data.cart[index].product.nameTm,
                              price: state.data.cart[index].product.price,
                              press: () {},
                              totalPrice:
                                  state.data.cart[index].subTotalPrice,
                              discountPrice:
                                  state.data.cart[index].product.salePrice,
                              discount:
                                  state.data.cart[index].product.discount,
                              category:
                                  state.data.cart[index].product.category,
                              itemCount: state.data.cart[index].count,
                              productId: state.data.cart[index].product.id,
                              quantity:
                                  state.data.cart[index].product.quantity,
                            );
                          }),
                    ),
                    Container(
                      color: Colors.white,
                      height: 90,alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SmallText('Jemi baha:', context: context),
                              const SizedBox(height: 5),
                              BlocBuilder<TotalPriceBloc, TotalPriceState>(
                                builder: (context, priceState) {
                                  if (priceState is TotalCostLoadingState) {
                                    return const CircularProgressIndicator();
                                  } else if (priceState
                                      is TotalCostLoadedState) {
                                    return MediumText('${priceState.data} TMT',
                                        context: context);
                                  } else {
                                    return const Text('0');
                                  }
                                },
                              ),
                            ],
                          ),
                          MainButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const OrderPage()));
                              // context.push(RouteNames.order);
                            },
                            buttonTile: 'Sargydy etmek',
                            topLeftRadius: 15,
                            bottomRightRadius: 15,
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: Text('Yalnyslyk yuze cykdy!'));
              }
            },
          );
        }
        return Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegistrationPage()));
                },
                child: BigText('Haryt sargyt etmek ucin agza bolmaly!',
                    context: context)));
      },
    );
  }
}
