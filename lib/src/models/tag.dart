part of imgur.models;

/// The base model for a tag.
///
/// https://api.imgur.com/models/tag
@JsonSerializable()
class Tag implements BaseModel {
  /// Name of the tag.
  String name;

  /// Number of followers for the tag.
  int followers;

  /// Total number of gallery items for the tag.
  @JsonKey(name: 'total_items')
  int totalItems;

  /// OPTIONAL, boolean representing whether or not the user is following the
  /// tag in their custom gallery.
  @JsonKey(nullable: true)
  bool following;

  /// Gallery items with current tag.
  List<dynamic> items;

  Tag({this.name, this.followers, this.totalItems, this.following, this.items});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TagToJson(this);
}
