part of imgur.models;

/// This model represents blocked users.
@JsonSerializable()
class BlockedUser implements BaseModel {
  /// The id of the blocked user.
  @JsonKey(name: 'blocked_id')
  String id;

  /// The url of the blocked user.
  @JsonKey(name: 'blocked_url')
  String url;

  BlockedUser({this.id, this.url});

  factory BlockedUser.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BlockedUserToJson(this);
}
