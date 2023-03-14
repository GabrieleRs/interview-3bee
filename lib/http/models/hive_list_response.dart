import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_3bee/http/models/hive_line_response.dart';
part 'hive_list_response.freezed.dart';
part 'hive_list_response.g.dart';

@freezed
class HiveListResponse with _$HiveListResponse {
  const factory HiveListResponse.initial({
    required List<HiveLineResponse> results,
  }) = _Initial;
  factory HiveListResponse.fromJson(Map<String, dynamic> json) =>
      _$HiveListResponseFromJson(json);
}
