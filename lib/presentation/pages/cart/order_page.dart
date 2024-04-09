import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/widgets/k_textfield.dart';

class OrderPage extends StatefulWidget {
   const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController addressCtrl = TextEditingController();
  bool isSubmitted = false;
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MediumText('Adresinizi girizin', context: context),
              const SizedBox(height: 15),
              KTextField(
                controller: addressCtrl,
                textCapitalization: TextCapitalization.words,
                isSubmitted: isSubmitted,

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
              const SizedBox(height: 15),
              MediumText('Toleg gornusi', context: context),
              const SizedBox(height: 15),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width /2 - 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(9)
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                          const Text('Option 1'),
                        ],
                      ),
                    ),

                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width /2 - 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(9)
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                          const Text('Option 2'),
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
                      MediumText('4215 TMT', context: context),
                    ],
                  ),
                    const SizedBox(height: 15),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MediumText('Dostawka puly', context: context),
                      MediumText('4215 TMT', context: context),
                    ],
                  ),
                    const SizedBox(height: 15),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MediumText('Arzanladys (-25%)', context: context),
                      MediumText('4215 TMT', context: context),
                    ],
                  ),
                    const SizedBox(height: 10),
                    const Divider(indent: 1,endIndent: 2,thickness: 1,),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumText('Jemi baha', context: context),
                        MediumText('4215 TMT', context: context),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MainButton(
                onPressed: _openAddExpenseOverlay,
                buttonTile: 'Tassyklan',
                topLeftRadius: 15,
                bottomRightRadius: 15,
                width: MediaQuery.of(context).size.width - 40,),

            ],
          ),
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (ctx) => Container(
        height: 500,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Icon(Icons.done_outline_rounded),
            const SizedBox(height: 20),
            VeryBigText("Done", context: context),
            const SizedBox(height: 20),
            MediumText('data', context: context),
            SizedBox(height: 20),
            MainButton(
              onPressed: _openAddExpenseOverlay,
              buttonTile: 'Tassyklan',
              topLeftRadius: 15,
              bottomRightRadius: 15,
              width: MediaQuery.of(context).size.width /2,),

          ],
        ),
      ),
    );
  }





}




