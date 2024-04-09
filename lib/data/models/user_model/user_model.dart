import '../../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userName,
    required super.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["full_name"],
        phoneNumber: json["phone_number"],
      );
}
