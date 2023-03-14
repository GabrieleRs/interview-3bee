import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User.initial({
    required String email,
    required String accessToken,
    required String refreshToken,
  }) = _Initial;
}
