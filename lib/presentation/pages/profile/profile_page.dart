import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/core/local/token_store.dart';
import 'package:tehno_mir/main.dart';
import 'package:tehno_mir/presentation/bloc/user/user_bloc.dart';
import 'package:tehno_mir/presentation/pages/profile/addresses/address_page.dart';
import 'package:tehno_mir/presentation/pages/profile/contact_us/contact_us_page.dart';
import 'package:tehno_mir/presentation/pages/profile/favorite/favorites_page.dart';
import 'package:tehno_mir/presentation/pages/registration/sign_up/registration_page.dart';
import 'package:tehno_mir/presentation/widgets/buttons/main_button.dart';
import 'package:tehno_mir/presentation/widgets/buttons/profile_button.dart';

import '../../bloc/auth/auth_bloc.dart';
import 'about_us/about_us_page.dart';
import 'history/history_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [


          // BlocBuilder<AuthBloc, AuthState>(
          //   builder: (context, state) {
          //     if (state is AuthLogged) {
          //       return BlocBuilder<UserBloc, UserState>(
          //         builder: (context, state) {
          //           print('STATE ${state}');
          //           if (state is UserLoadedState) {
          //             return ProfileWidget(
          //               state.user.userName,
          //               paddingBottom: 0,
          //               paddingRight: 0,
          //               paddingTop: 0,
          //               widget: Padding(
          //                 padding: const EdgeInsets.only(right: 10),
          //                 child: BigText(
          //                   state.user.phoneNumber ?? '',
          //                   context: context,
          //                 ).copyWith(
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.w600,
          //                   color: Colors.black26,
          //                 ),
          //               ),
          //             );
          //           }
          //          else if(state is UserErrorState){
          //            return Text(state.message);
          //           }
          //          else{
          //            return SizedBox();
          //           }
          //
          //
          //         },
          //       );
          //     } else {
          //       return ProfileWidget(
          //         '',
          //         paddingBottom: 0,
          //         paddingRight: 0,
          //         paddingTop: 0,
          //         widget: MainButton(
          //           onPressed: () {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => const RegistrationPage()));
          //           },
          //           buttonTile: 'Ulgama girmek',
          //           topLeftRadius: 15,
          //           bottomRightRadius: 15,
          //           width: MediaQuery.of(context).size.width / 2 - 20,
          //         ),
          //       );
          //     }
          //   },
          // ),

          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLogged) {
                return ProfileWidget(
                  state.data?.userName ?? '',
                  paddingBottom: 0,
                  paddingRight: 0,
                  paddingTop: 0,
                  widget: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BigText(
                      state.data?.phoneNumber ?? '',
                      context: context,
                    ).copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  ),
                );
              }
              else{
               return ProfileWidget(
                  '',
                  paddingBottom: 0,
                  paddingRight: 0,
                  paddingTop: 0,
                  widget: MainButton(
                    onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));
                    },
                    buttonTile: 'Ulgama girmek',
                    topLeftRadius: 15,
                    bottomRightRadius: 15,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                  ),
                );
              }

            },
          ),

          ProfileButton(
            'Halanlarym',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FavoritePage()));
              //context.push(RouteNames.favourites);
            },
          ),
          ProfileButton(
            'Edilen sargytlar',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HistoryPage()));
              //context.push(RouteNames.favourites);
            },
          ),
          ProfileButton(
            'Adreslarym',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const AddressPage()));
              //context.push(RouteNames.address);
            },
          ),
          ProfileButton(
            'Habarlasmak',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactUsPage()));
              // context.push(RouteNames.contuctUs);
            },
          ),
          ProfileButton(
            'Biz barada',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutUsPage()));

            },
          ),
          ProfileWidget('Dil calysmak',
              widget: Switch.adaptive(
                  value: true,
                  activeColor: AppColors.curnil,
                  onChanged: (val) {
                    !val;
                  })),

          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLogged) {
                return ProfileButton(
                  'Ulgamdan cykmak',
                  onTap: () {
                    _showDialog("Siz ulgamdan cykmakcymy?");
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  void _showDialog(String title) {
    showDialog(
      context: context,
      useRootNavigator: false,
      // barrierDismissible: false,
      builder: (BuildContext ctx) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //backgroundColor: AppColors.cardColor3,
        elevation: 8,
        content: BigText(title ?? '', context: context),
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
                  context.read<AuthBloc>().add(SignOutAuthEvent());
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  MyApp()));
                },
                child: MediumText(
                  'Hawa',
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
