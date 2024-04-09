import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).appBarTheme.backgroundColor,),
      body: Center(
        child:  VeryBigText(
          'Salgylarym',
          context: context,
        ),
      ),
    );
  }
}
