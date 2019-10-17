part of imgur.models;

/// This model represents blocked users
@JsonSerializable()
class BlockedUser implements BaseModel {
  @JsonKey(name: 'blocked_id')
  String blockedId;

  @JsonKey(name: 'blocked_url')
  String blockedUrl;

  BlockedUser({this.blockedId, this.blockedUrl});

  factory BlockedUser.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserFromJson(json);
  Map<String, dynamic> toJson() => _$BlockedUserToJson(this);
}
