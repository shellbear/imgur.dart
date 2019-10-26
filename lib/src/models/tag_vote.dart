part of imgur.models;

/// The base model for a tag.
///
/// https://api.imgur.com/models/tag_vote
@JsonSerializable()
class TagVote implements BaseModel {
  /// Number of upvotes.
  int ups;

  /// Number of downvotes.
  int downs;

  /// Name of the tag.
  String name;

  /// Author of the tag.
  String author;

  TagVote({this.ups, this.downs, this.name, this.author});

  factory TagVote.fromJson(Map<String, dynamic> json) =>
      _$TagVoteFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TagVoteToJson(this);
}
