import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/widgets/k_textfield.dart';
import '../../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../bloc/auth/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  dispose() {
    phoneNumberCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          print('Loading.....');
        } else if (state is AuthLogged) {

        } else if (state is AuthLoggedFail) {
          print('Erorr../////////////////////////////////////////...');
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: MediumText('Telefon belgiňizi we parolynyzy giriziň',
                    context: context),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    PhoneNumField(
                      phoneCtrl: phoneNumberCtrl,
                      isSubmitted: false,
                      label: 'Telefon nomerinizi yazyn',
                    ),
                    const SizedBox(height: 10),
                    KTextField(
                      controller: passwordCtrl,
                      labelText: 'passwordCtrl yazyn',
                      keyboardType: TextInputType.visiblePassword,
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
              const SizedBox(height: 20),
              MainButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(SignInAuthEvent(SignInParams(
                      phoneNumber: phoneNumberCtrl.text,
                      password: passwordCtrl.text,
                    )));
                  }
                },
                buttonTile: 'Dowam ediň',
                topLeftRadius: 15,
                bottomRightRadius: 15,
                width: MediaQuery.of(context).size.width - 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
