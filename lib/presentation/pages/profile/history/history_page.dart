import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/bloc/order/order_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  
  
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrderHistoryEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edilen sargytlar'),
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderHistoryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrderHistoryErrorState) {
              print(state.message);
              return const Text("Yalnyslyk yuze cykdy");
            } else if (state is OrderHistoryLoadedState) {

              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    DateTime dateTime = state.data[index].orderDate;

                    String formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
                return Container(
                  margin: const EdgeInsets.all(10),
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
                          MediumText('Toelgin gornusi', context: context),
                          MediumText(state.data[index].paymentType == 'cash'?'Nagt': 'Kartdan',
                              context: context),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText('Harytlar', context: context),
                          MediumText('${state.data[index].productPrice} TMT',
                              context: context),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText('Dostawka puly', context: context),
                          MediumText('${state.data[index].deliveryFee} TMT',
                              context: context),
                        ],
                      ),
                      const SizedBox(height: 15),
                      state.data[index].discount != 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MediumText(
                                    'Arzanladys (-${state.data[index].discount}%)',
                                    context: context),
                                MediumText('${state.data[index].deliveryFee} TMT',
                                    context: context),
                              ],
                            )
                          : const SizedBox(),

                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText('Jemi baha', context: context),
                          MediumText('${state.data[index].totalAmount} TMT',
                              context: context),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText('Edilen wagty:', context: context),
                          MediumText(formattedDate,
                              context: context),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MediumText('Salgysy', context: context),
                            const SizedBox(height: 10),
                            MediumText(state.data[index].address,
                                context: context),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
            } else {
              return const Text('Yalnyslyk bar');
            }
          },
        ));
  }
}
