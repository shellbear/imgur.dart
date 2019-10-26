part of imgur.models;

/// The data model formatted for gallery albums.
///
/// https://api.imgur.com/models/gallery_album
@JsonSerializable()
class GalleryAlbum implements BaseModel {
  /// The ID for the image.
  String id;

  /// The title of the album in the gallery.
  String title;

  /// The description of the album in the gallery.
  String description;

  /// Time inserted into the gallery.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// The ID of the album cover image.
  String cover;

  /// The width, in pixels, of the album cover image.
  @JsonKey(name: 'cover_width')
  int coverWidth;

  /// The height, in pixels, of the album cover image.
  @JsonKey(name: 'cover_height')
  int coverHeight;

  /// The account username or null if it's anonymous.
  @JsonKey(name: 'account_url')
  String accountUrl;

  /// The account ID of the account that uploaded it, or null.
  @JsonKey(name: 'account_id', nullable: true)
  int accountId;

  /// The privacy level of the album, you can only view public if not logged
  /// in as album owner.
  String privacy;

  /// The view layout of the album.
  String layout;

  /// The number of image views.
  int views;

  /// The URL link to the album.
  String link;

  /// Upvotes for the image.
  int ups;

  /// Number of downvotes for the image.
  int downs;

  /// Upvotes minus downvotes.
  int points;

  /// Imgur popularity score.
  int score;

  /// if it's an album or not.
  @JsonKey(name: 'is_album')
  bool isAlbum;

  /// The current user's vote on the album. null if not signed in or if the
  /// user hasn't voted on it.
  @JsonKey(fromJson: stringToVote, toJson: voteToString)
  VoteType vote;

  /// The total number of image favorites.
  @JsonKey(name: 'favorite_count')
  int favoriteCount;

  /// A list of tags associated with the image.
  @JsonKey(toJson: baseModelListToJson)
  List<Tag> tags;

  /// Indicates if the current user has favorite the album.
  ///
  /// Defaults to false if not signed in.
  bool favorite;

  /// Indicates if the album has been marked as nsfw or not.
  ///
  /// Defaults to null if information is not available.
  bool nsfw;

  /// Number of comments on the gallery album.
  @JsonKey(name: 'comment_count')
  int commentCount;

  /// Topic of the gallery album.
  String topic;

  /// Topic ID of the gallery album.
  @JsonKey(name: 'topic_id')
  dynamic topicId;

  /// The total number of images in the album.
  @JsonKey(name: 'images_count')
  int imagesCount;

  /// An array of all the images in the album.
  ///
  /// Only available when requesting the direct album.
  @JsonKey(toJson: baseModelListToJson)
  List<Image> images;

  @JsonKey(name: 'in_most_viral')
  dynamic inMostViral;

  GalleryAlbum(
      {this.id,
      this.title,
      this.description,
      this.datetime,
      this.cover,
      this.coverWidth,
      this.coverHeight,
      this.accountUrl,
      this.accountId,
      this.privacy,
      this.layout,
      this.views,
      this.link,
      this.ups,
      this.downs,
      this.points,
      this.score,
      this.isAlbum,
      this.vote,
      this.favorite,
      this.nsfw,
      this.commentCount,
      this.topic,
      this.topicId,
      this.imagesCount,
      this.images,
      this.inMostViral,
      this.favoriteCount,
      this.tags});

  factory GalleryAlbum.fromJson(Map<String, dynamic> json) =>
      _$GalleryAlbumFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GalleryAlbumToJson(this);
}
