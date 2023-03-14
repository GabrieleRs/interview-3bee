part of 'login_page_cubit.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState.initial() = _Initial;

  const factory LoginPageState.loading({
    required String username,
    required String password,
    required String apiariesId,
  }) = _Loading;

  const factory LoginPageState.success({
    required String username,
    required String password,
    required String apiariesId,
    required User user,
  }) = _Success;

  const factory LoginPageState.failure({
    required String username,
    required String password,
    required String apiariesId,
    required String error,
  }) = _Failure;
}
