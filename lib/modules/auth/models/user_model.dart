import '../../../core/utils/constants.dart';

class UserModel {
  final String id;

  UserModel({required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? Constants.empty,
      );
}
