import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';
import 'package:tehno_mir/domain/entities/about_us.dart';
import 'package:tehno_mir/presentation/bloc/about_us/about_us_cubit.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AboutUsCubit>().getShopInfo();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit, AboutUsState>(
      builder: (context, state) {
        if (state is AboutUsLoadingState) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is AboutUsLoadedState) {
          return AboutUsWidget(model: state.data);
        } else if (state is AboutUsErrorState) {
          return Center(
            child: BigText(state.message, context: context),
          );
        } else if (state is AboutUsEmptyState) {
          return Center(
            child: BigText('Bos', context: context),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key,required this.model});
final  AboutUsEntity model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biz barada'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(model.titleTm ?? '', context: context),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumText('Telefon belgimiz:', context: context),
                  MediumText(model.phoneNumber ?? '', context: context),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  MediumText('Email:', context: context),
                  MediumText(model.email ?? '', context: context),
                ],
              ),
              const SizedBox(height: 15),
              MediumText('Salgysy:', context: context),
              const SizedBox(height: 15),
              MediumText(model.addressTm, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

