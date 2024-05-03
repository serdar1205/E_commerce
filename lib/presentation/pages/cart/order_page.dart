import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/domain/usecases/order/order_product.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';
import 'package:tehno_mir/presentation/bloc/order/order_bloc.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/widgets/k_textfield.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  FToast? fToast = FToast();

  TextEditingController addressCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _selectedValue = 1;
  String paymentType = 'cash';

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrderPreviewEvent());
    fToast!.init(context);
  }

  @override
  void dispose() {
    addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sebet'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderPreviewLoadingState) {
                return CircularProgressIndicator();
              } else if (state is OrderPreviewLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText('Adresinizi girizin', context: context),
                    const SizedBox(height: 15),
                    Form(
                      key: _formKey,
                      child: KTextField(
                        controller: addressCtrl,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        hintText: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Doldurmaly';
                          }
                          if (value.length < 3) {
                            return 'yene';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    MediumText('Toleg gornusi', context: context),
                    const SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(9)),
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                      paymentType = 'cash';
                                    });
                                  },
                                ),
                                const Text('Nagt'),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(9)),
                            child: Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                      paymentType = 'terminal';
                                    });
                                  },
                                ),
                                const Text('Terminal'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    MediumText('Toleg', context: context),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText('Harytlar', context: context),
                              MediumText('${state.data.productPrice} TMT',
                                  context: context),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText('Dostawka puly', context: context),
                              MediumText('${state.data.deliveryFee} TMT',
                                  context: context),
                            ],
                          ),
                          const SizedBox(height: 15),
                          state.data.discount != 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MediumText(
                                        'Arzanladys (-${state.data.discount}%)',
                                        context: context),
                                    MediumText('${state.data.deliveryFee} TMT',
                                        context: context),
                                  ],
                                )
                              : SizedBox(),
                          const SizedBox(height: 10),
                          const Divider(
                            indent: 1,
                            endIndent: 2,
                            thickness: 1,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText('Jemi baha', context: context),
                              MediumText('${state.data.totalAmount} TMT',
                                  context: context),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    MainButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<OrderBloc>().add(OrderProductEvent(
                              OrderProductParams(
                                paymentType:paymentType,
                                productPrice:state.data.productPrice,
                                deliveryFee:state.data.deliveryFee,
                                discount:state.data.discount,
                                totalAmount:state.data.totalAmount,
                                address:addressCtrl.text,
                                orderDate:DateTime.now(),
                              )));
                          print(OrderProductParams(
                            paymentType:paymentType,
                            productPrice:state.data.productPrice,
                            deliveryFee:state.data.deliveryFee,
                            discount:state.data.discount,
                            totalAmount:state.data.totalAmount,
                            address:addressCtrl.text,
                            orderDate:DateTime.now(),
                          ).toString());
                          _showToast('Sargyt edildi');
                          Navigator.of(context).pop();
                          context.read<CartBloc>().add(ClearCartEvent());
                        }else{
                          _showToast('Sargyt ugradylmady');
                        }

                        //Navigator.of(context).pop();
                      },
                      buttonTile: 'Tassyklan',
                      topLeftRadius: 15,
                      bottomRightRadius: 15,
                      width: MediaQuery.of(context).size.width - 40,
                    ),
                  ],
                );
              } else if (state is OrderPreviewErrorState) {
                return Text(state.message);
              } else {
                return Text('yalnyslyk bar');
              }
            },
          ),
        ),
      ),
    );
  }
  void _showToast(String text) {
    Widget toast =  Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromRGBO(44, 218, 82, 0.2),
      ),
      child:  Text(text),
    );

    fToast!.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
