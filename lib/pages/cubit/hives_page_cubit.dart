import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_3bee/http/models/hive_list_response.dart';

import '../../data/user.dart';
import '../../http/api_3bee.dart';
import '../../http/models/hive_line_response.dart';

part 'hives_page_state.dart';
part 'hives_page_cubit.freezed.dart';

class HivesPageCubit extends Cubit<HivesPageState> {
  final api = Api3Bee();
  HivesPageCubit() : super(const HivesPageState.initial());
  fetchHives(String apiariesId, User user) {
    state.maybeWhen(
      loading: () {},
      orElse: () async {
        emit(const HivesPageState.loading());
        try {
          final hives = await api.fetchHivesByApiariesId(apiariesId, user);
          emit(HivesPageState.success(hives: hives));
        } catch (e) {
          emit(HivesPageState.failure(error: e.toString()));
        }
      },
    );
  }
}
