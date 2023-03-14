import 'package:freezed_annotation/freezed_annotation.dart';
part 'hive_line_response.freezed.dart';
part 'hive_line_response.g.dart';

@freezed
class HiveLineResponse with _$HiveLineResponse {
  const factory HiveLineResponse.initial({
    @JsonKey(name: 'image_url') required String imageUrl,
    required String name,
    @JsonKey(name: 'external_id') required String externalId,
  }) = _Initial;
  factory HiveLineResponse.fromJson(Map<String, dynamic> json) =>
      _$HiveLineResponseFromJson(json);
}
