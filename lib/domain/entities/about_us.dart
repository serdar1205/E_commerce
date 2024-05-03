import 'package:equatable/equatable.dart';

class AboutUsEntity extends Equatable {
  final int id;
  final String titleTm;
  final String titleEn;
  final String phoneNumber;
  final String email;
  final String addressTm;
  final String addressEn;

  const AboutUsEntity({
    required this.id,
    required this.titleTm,
    required this.titleEn,
    required this.phoneNumber,
    required this.email,
    required this.addressTm,
    required this.addressEn,
  });

  @override
  List<Object> get props =>
      [id, titleTm, titleEn, phoneNumber, email, addressTm, addressEn,];

}
