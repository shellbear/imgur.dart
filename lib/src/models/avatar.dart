part of imgur.models;

/// This model represents an avatar.
@JsonSerializable()
class Avatar implements BaseModel {
  /// The avatar name.
  @JsonKey(nullable: true)
  String name;

  /// The avatar Url.
  String location;

  Avatar({this.name, this.location});

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable()
class AvatarData implements BaseModel {
  /// The avatar name.
  @JsonKey(name: 'avatar_name', nullable: true)
  String name;

  /// The avatar Url.
  @JsonKey(name: 'avatar')
  String location;

  AvatarData({this.name, this.location});

  factory AvatarData.fromJson(Map<String, dynamic> json) =>
      _$AvatarDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AvatarDataToJson(this);
}

@JsonSerializable()
class AvatarListData implements BaseModel {
  /// A list of available avatars.
  @JsonKey(name: 'available_avatars', toJson: baseModelListToJson)
  List<Avatar> availableAvatars;

  /// The total number of available avatars.
  @JsonKey(name: 'available_avatars_count')
  int availableAvatarsCount;

  /// If the avatars are default or not.
  @JsonKey(name: 'avatars_are_default')
  bool avatarsAreDefault;

  AvatarListData({
    this.availableAvatars,
    this.availableAvatarsCount,
    this.avatarsAreDefault,
  });

  factory AvatarListData.fromJson(Map<String, dynamic> json) =>
      _$AvatarListDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AvatarListDataToJson(this);
}
