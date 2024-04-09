import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/main.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/widgets/k_textfield.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../domain/usecases/user/sign_up_usecase.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../sign_in/sign_in_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  bool _isChecked = false;

  @override
  dispose() {
    nameCtrl.dispose();
    phoneNumberCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }
//tradepulse
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          print('Loading.....');
        } else if (state is AuthLogged) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MyApp()));
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
              BigText('Hoş Geldiňiz', context: context),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: MediumText(
                    'Giriş kody almak üçin adyňyzy we telefon belgiňizi giriziň',
                    context: context),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    KTextField(
                      controller: nameCtrl,
                      isSubmitted: false,
                      labelText: 'Adynyzy yazyn',
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'doldurmaly';
                        } else if (val.length < 3) {
                          return '3 den kop bolmaly';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    PhoneNumField(
                      phoneCtrl: phoneNumberCtrl,
                      isSubmitted: false,
                      label: 'Telefon nomerinizi yazyn',
                    ),
                    const SizedBox(height: 10),
                    KTextField(
                      controller: passwordCtrl,
                      isSubmitted: false,
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
                    const SizedBox(height: 10),
                    KTextField(
                      controller: confirmPasswordCtrl,
                      isSubmitted: false,
                      labelText: 'confirmPasswordCtrl yazyn',
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
                    context.read<AuthBloc>().add(SignUpAuthEvent(SignUpParams(
                          userName: nameCtrl.text,
                          phoneNumber: phoneNumberCtrl.text,
                          password: passwordCtrl.text,
                          confirmPassword: confirmPasswordCtrl.text,
                        )));
                  }
                },
                buttonTile: 'Dowam et',
                topLeftRadius: 15,
                bottomRightRadius: 15,
                width: MediaQuery.of(context).size.width - 40,
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInPage()));
                  },
                  child: MediumText('Siz on agza boldunyzmy?',
                      context: context).copyWith(color: AppColors.curnil),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
