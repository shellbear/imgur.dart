part of imgur.models;

/// This model represents a mix between an album and a gallery.
@JsonSerializable()
class GalleryAlbumImage implements BaseModel {
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

  /// The privacy level of the album, you can only view public if not logged in
  /// as album owner.
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

  /// The current user's vote on the album.
  ///
  /// null if not signed in or if the user hasn't voted on it
  @JsonKey(fromJson: stringToVote, toJson: voteToString)
  VoteType vote;

  /// The total number of image favorites.
  @JsonKey(name: 'favorite_count')
  int favoriteCount;

  /// A list of tags associated with the image.
  @JsonKey(toJson: baseModelListToJson)
  List<Tag> tags;

  /// If the video has sound or not.
  @JsonKey(nullable: true, name: 'has_sound')
  bool hasSound;

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

  /// Indicates if the image is in the most viral gallery or not.
  @JsonKey(name: 'in_most_viral')
  dynamic inMostViral;

  /// Image MIME type.
  String type;

  /// Is the image animated.
  bool animated;

  /// The width of the image in pixels.
  int width;

  /// The height of the image in pixels.
  int height;

  /// The size of the image in bytes.
  int size;

  /// Bandwidth consumed by the image in bytes.
  int bandwidth;

  /// OPTIONAL, the delete hash, if you're logged in as the image owner.
  @JsonKey(nullable: true)
  String deletehash;

  /// OPTIONAL, The .gifv link. Only available if the image is animated and
  /// type is 'image/gif'.
  @JsonKey(nullable: true)
  String gifv;

  /// OPTIONAL, The direct link to the .mp4.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  @JsonKey(nullable: true)
  String mp4;

  /// OPTIONAL, The Content-Length of the .mp4.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  /// Note that a zero value (0) is possible if the video has not yet been
  /// generated.
  @JsonKey(name: 'mp4_size', nullable: true)
  int mp4Size;

  /// OPTIONAL, Whether the image has a looping animation.
  ///
  /// Only available if the image is animated and type is 'image/gif'.
  @JsonKey(nullable: true)
  bool looping;

  GalleryAlbumImage({
    this.id,
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
    this.favoriteCount,
    this.tags,
    this.hasSound,
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
    this.type,
    this.animated,
    this.width,
    this.height,
    this.size,
    this.bandwidth,
    this.deletehash,
    this.gifv,
    this.mp4,
    this.mp4Size,
    this.looping,
  });

  factory GalleryAlbumImage.fromJson(Map<String, dynamic> json) =>
      _$GalleryAlbumImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GalleryAlbumImageToJson(this);

  GalleryAlbum toAlbum() => GalleryAlbum.fromJson(toJson());

  GalleryImage toImage() => GalleryImage.fromJson(toJson());
}
