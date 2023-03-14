import 'package:freezed_annotation/freezed_annotation.dart';
part 'apiaries_line_response.freezed.dart';
part 'apiaries_line_response.g.dart';

@freezed
class ApiariesLineResponse with _$ApiariesLineResponse {
  const factory ApiariesLineResponse.initial({
    required int id,
    required String name,
    required Map<String, dynamic> weights,
  }) = _Initial;
  factory ApiariesLineResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiariesLineResponseFromJson(json);
}
