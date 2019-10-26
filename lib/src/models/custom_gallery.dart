part of imgur.models;

/// This model represents a user's custom or filtered gallery.
///
/// https://api.imgur.com/models/custom_gallery
@JsonSerializable()
class CustomGallery implements BaseModel {
  /// Username of the account that created the custom gallery.
  @JsonKey(name: 'account_url')
  String accountUrl;

  /// The URL link to the custom gallery.
  String link;

  /// An array of all the tag names in the custom gallery.
  List<String> tags;

  /// The total number of gallery items in the custom gallery.
  @JsonKey(name: 'item_count')
  int itemCount;

  /// An array of all the gallery items in the custom gallery.
  List<dynamic> items;

  CustomGallery({
    this.accountUrl,
    this.link,
    this.tags,
    this.itemCount,
    this.items,
  });

  factory CustomGallery.fromJson(Map<String, dynamic> json) =>
      _$CustomGalleryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomGalleryToJson(this);
}
