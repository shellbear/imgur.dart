part of imgur.models;

/// A model used for for single ID response.
@JsonSerializable()
class RawId implements BaseModel {
  /// Name of the tag
  dynamic id;

  RawId({this.id});

  factory RawId.fromJson(Map<String, dynamic> json) => _$RawIdFromJson(json);
  Map<String, dynamic> toJson() => _$RawIdToJson(this);
}
