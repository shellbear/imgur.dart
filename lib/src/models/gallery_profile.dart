part of imgur.models;

/// The totals for a users gallery information.
///
/// https://api.imgur.com/models/gallery_profile
@JsonSerializable()
class GalleryProfile implements BaseModel {
  /// Total number of comments the user has made in the gallery.
  @JsonKey(name: 'total_gallery_comments')
  int totalGalleryComments;

  /// Total number of user's favorite items in the gallery.
  @JsonKey(name: 'total_gallery_favorites')
  int totalGalleryFavorites;

  /// Total number of images submitted by the user.
  @JsonKey(name: 'total_gallery_submissions')
  int totalGallerySubmissions;

  /// An array of trophies that the user has.
  @JsonKey(toJson: baseModelListToJson)
  List<Trophy> trophies;

  GalleryProfile(
      {this.totalGalleryComments,
      this.totalGalleryFavorites,
      this.totalGallerySubmissions,
      this.trophies});

  factory GalleryProfile.fromJson(Map<String, dynamic> json) =>
      _$GalleryProfileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GalleryProfileToJson(this);
}
