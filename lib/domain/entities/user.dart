import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userName;
  final String phoneNumber;

  const UserEntity({
    required this.userName,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [
        userName,
        phoneNumber,
      ];
}
