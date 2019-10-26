part of imgur.models;

/// This model represents account trophies.
@JsonSerializable()
class Trophy implements BaseModel {
  /// The ID of the trophy, this is unique to each trophy.
  int id;

  /// The name of the trophy.
  String name;

  /// Can be thought of as the ID of a trophy type.
  @JsonKey(name: 'name_clean')
  String nameClean;

  /// A description of the trophy and how it was earned.
  String description;

  /// The ID of the image or the ID of the comment where the trophy was earned.
  String data;

  /// A link to where the trophy was earned.
  @JsonKey(name: 'data_link')
  String dataLink;

  /// Date the trophy was earned.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// URL of the image representing the trophy.
  String image;

  Trophy(
      {this.id,
      this.name,
      this.nameClean,
      this.description,
      this.data,
      this.dataLink,
      this.datetime,
      this.image});

  factory Trophy.fromJson(Map<String, dynamic> json) => _$TrophyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TrophyToJson(this);
}
