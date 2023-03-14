import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_3bee/http/models/apiaries_line_response.dart';
part 'apiaries_list_response.freezed.dart';
part 'apiaries_list_response.g.dart';

@freezed
class ApiariesListResponse with _$ApiariesListResponse {
  const factory ApiariesListResponse.initial({
    @JsonKey(name: 'results') required List<ApiariesLineResponse> results,
  }) = _Initial;
  factory ApiariesListResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiariesListResponseFromJson(json);
}
