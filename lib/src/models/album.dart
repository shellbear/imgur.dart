part of imgur.models;

/// This model represents the data for albums.
///
/// https://api.imgur.com/models/album
@JsonSerializable()
class Album implements BaseModel {
  /// The ID for the album.
  String id;

  /// The title of the album in the gallery.
  String title;

  /// he description of the album in the gallery.
  String description;

  /// Time inserted into the gallery.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// The ID of the album cover image.
  String cover;

  /// The width, in pixels, of the album cover image.
  int coverWidth;

  /// The height, in pixels, of the album cover image.
  @JsonKey(name: 'cover_height')
  int coverHeight;

  /// The account username or null if it's anonymous.
  @JsonKey(name: 'account_url')
  String accountUrl;

  /// The account ID or null if it's anonymous.
  @JsonKey(name: 'account_id')
  int accountId;

  /// The privacy level of the album, you can only view public if not logged
  /// in as album owner.
  String privacy;

  /// The view layout of the album.
  String layout;

  /// The number of album views.
  int views;

  /// The URL link to the album.
  String link;

  /// Indicates if the current user has favorite the image.
  ///
  /// Defaults to false if not signed in.
  bool favorite;

  /// Indicates if the image has been marked as nsfw or not.
  ///
  /// Defaults to null if information is not available.
  bool nsfw;

  /// If the image has been categorized by our backend then this will contain
  /// the section the image belongs in.
  String section;

  /// Order number of the album on the user's album page
  /// (defaults to 0 if their albums haven't been reordered).
  int order;

  /// The total number of images in the album.
  @JsonKey(name: 'images_count')
  int imagesCount;

  /// Array of Images	An array of all the images in the album
  /// (only available when requesting the direct album).
  @JsonKey(toJson: baseModelListToJson)
  List<Image> images;

  /// True if the image has been submitted to the gallery, false if otherwise.
  @JsonKey(name: 'in_gallery')
  bool inGallery;

  /// OPTIONAL, the delete hash, if you're logged in as the album owner
  @JsonKey(name: 'deletehash', nullable: true)
  String deleteHash;

  Album({
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
    this.link,
    this.favorite,
    this.nsfw,
    this.section,
    this.order,
    this.imagesCount,
    this.images,
    this.inGallery,
    this.deleteHash,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
