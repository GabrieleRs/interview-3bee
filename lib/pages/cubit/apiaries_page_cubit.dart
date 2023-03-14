import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/user.dart';
import '../../http/api_3bee.dart';
import '../../http/models/apiaries_list_response.dart';

part 'apiaries_page_state.dart';
part 'apiaries_page_cubit.freezed.dart';

class ApiariesPageCubit extends Cubit<ApiariesPageState> {
  final api = Api3Bee();
  ApiariesPageCubit() : super(ApiariesPageState.initial());
  fetchApiaries(User user) {
    state.maybeWhen(
      loading: () {},
      orElse: () async {
        emit(const ApiariesPageState.loading());
        try {
          final apiaries = await api.fetchApiaries(user);
          emit(ApiariesPageState.success(apiaries: apiaries));
        } catch (e) {
          emit(ApiariesPageState.failure(error: e.toString()));
        }
      },
    );
  }
}
