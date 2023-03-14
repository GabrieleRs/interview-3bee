part of 'hives_page_cubit.dart';

@freezed
class HivesPageState with _$HivesPageState {
  const factory HivesPageState.initial() = _Initial;
  const factory HivesPageState.loading() = _Loading;
  const factory HivesPageState.success({
    required HiveListResponse hives,
  }) = _Success;
  const factory HivesPageState.failure({
    required String error,
  }) = _Failure;
}
