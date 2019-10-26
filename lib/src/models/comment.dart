part of imgur.models;

/// This data model represents an images comment.
///
/// https://api.imgur.com/models/comment
@JsonSerializable()
class Comment implements BaseModel {
  /// The ID for the comment.
  int id;

  /// The ID of the image that the comment is for.
  @JsonKey(name: 'image_id')
  String imageId;

  /// The comment text.
  String comment;

  /// Username of the author of the comment.
  String author;

  /// The account ID for the author.
  @JsonKey(name: 'author_id')
  int authorId;

  /// If this comment was done to an album.
  @JsonKey(name: 'on_album')
  bool onAlbum;

  /// The ID of the album cover image, this is what should be displayed for
  /// album comments.
  @JsonKey(name: 'album_cover')
  String albumCover;

  /// Number of upvotes for the comment.
  int ups;

  /// The number of downvotes for the comment.
  int downs;

  /// the number of upvotes - downvotes.
  double points;

  /// Timestamp of creation.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// If this is a reply, this will be the value of the comment_id for the
  /// caption this a reply for.
  @JsonKey(name: 'parent_id')
  int parentId;

  /// Marked true if this caption has been deleted.
  bool deleted;

  /// The current user's vote on the comment. null if not signed in or if the
  /// user hasn't voted on it.
  @JsonKey(fromJson: stringToVote, toJson: voteToString)
  VoteType vote;

  /// All of the replies for this comment. If there are no replies to the
  /// comment then this is an empty set.
  @JsonKey(toJson: baseModelListToJson)
  List<Comment> children;

  Comment(
      {this.id,
      this.comment,
      this.albumCover,
      this.imageId,
      this.onAlbum,
      this.ups,
      this.downs,
      this.points,
      this.datetime,
      this.author,
      this.authorId,
      this.parentId,
      this.deleted,
      this.vote,
      this.children});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
