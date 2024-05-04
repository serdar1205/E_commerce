import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';

import '../../../core/constants/sizes/app_text_size.dart';
import '../../widgets/buttons/main_button.dart';

class PinputExample extends StatefulWidget {
  const PinputExample({Key? key}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

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
              BigText('Hoş Geldiňiz',context: context),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: MediumText(
                    'Giriş kody almak üçin adyňyzy we telefon belgiňizi giriziň',context: context),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          controller: pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          validator: (value) {
                            return value == '2222' ? null : 'Pin is incorrect';
                          },
                          // onClipboardFound: (value) {
                          //   debugPrint('onClipboardFound: $value');
                          //   pinController.setText(value);
                          // },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: focusedBorderColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          focusNode.unfocus();
                          formKey.currentState!.validate();
                        },
                        child:  SmallText('Sms kody gelmedi',context: context,).copyWith(color: AppColors.textCurnilColor),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              MainButton(
                onPressed: (){
               //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PinputExample()));
                },
                buttonTile: 'Dowam et',
                topLeftRadius: 15,
                bottomRightRadius: 15,
                width: MediaQuery.of(context).size.width - 40,),

            ],
          ),
        ),
      );

  }
}