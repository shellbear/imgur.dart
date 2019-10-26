part of imgur.models;

/// The base model for a vote.
///
/// https://api.imgur.com/models/vote
@JsonSerializable()
class Vote implements BaseModel {
  /// Number of upvotes.
  int ups;

  /// Number of downvotes.
  int downs;

  Vote({this.ups, this.downs});

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VoteToJson(this);
}
