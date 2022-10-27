import 'user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';
@JsonSerializable()
class UsersResponse{
  @JsonValue('users')
  List<User> users;
  UsersResponse({required this.users});

  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}