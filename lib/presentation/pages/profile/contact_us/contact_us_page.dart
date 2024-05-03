import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/widgets/k_textfield.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController messageCtrl = TextEditingController();

  @override
  dispose() {
    emailCtrl.dispose();
    messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('habarlas'),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'AppLocalizations.of(context)!.supportLongText',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  KTextField(
                    controller: emailCtrl,
                    labelText: 'E-poctanyzy girizin',
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'doldurmaly';
                      } else if (val.length < 3) {
                        return '3 den kop bolmaly';
                      } else if (!RegExp(r'@[a-zA-Z]+\.[a-zA-Z]{2}')
                          .hasMatch(val)) {
                        return 'error';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  KTextField(
                    controller: messageCtrl,
                    labelText: 'Hatynyz',
                    maxLines: 5,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'doldurmaly';
                      } else if (val.length < 3) {
                        return '3 den kop bolmaly';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MainButton(
              onPressed: (){},
              buttonTile: 'Ugratmak',
              topLeftRadius: 15,
              bottomRightRadius: 15,
              width: MediaQuery.of(context).size.width - 40,),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BigText('phone number', context: context),
                const SizedBox(width: 15),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.curnil,),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)), // Adjust the radius as needed
                      ),
                    ),
                  ),
                  onPressed: () async {
                    // if (await canLaunchUrl(Uri(scheme: 'tel', path: '480065'))) {
                    //   //launchUrl(Uri(scheme: 'tel', path: '480065'));
                    // }
                  },
                  child: const Icon(
                    Icons.phone,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
