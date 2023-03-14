import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_3bee/http/api_3bee.dart';

import '../../data/user.dart';

part 'login_page_state.dart';
part 'login_page_cubit.freezed.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  final api = Api3Bee();
  LoginPageCubit() : super(const LoginPageState.initial());

  login({
    required String username,
    required String password,
    required String apiariesId,
  }) async {
    state.maybeWhen(
      loading: (username, password) {},
      orElse: () async {
        emit(LoginPageState.loading(
          username: username,
          password: password,
        ));
        try {
          final user = await api.login(username, password);
          emit(LoginPageState.success(
            username: username,
            password: password,
            user: user,
          ));
        } catch (e) {
          emit(LoginPageState.failure(
            username: username,
            password: password,
            error: e.toString(),
          ));
        }
      },
    );
  }
}
