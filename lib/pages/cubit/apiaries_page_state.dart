part of 'apiaries_page_cubit.dart';

@freezed
class ApiariesPageState with _$ApiariesPageState {
  const factory ApiariesPageState.initial() = _Initial;
  const factory ApiariesPageState.loading() = _Loading;
  const factory ApiariesPageState.success({
    required ApiariesListResponse apiaries,
  }) = _Success;
  const factory ApiariesPageState.failure({
    required String error,
  }) = _Failure;
}
