part of imgur.models;

/// This model is used to represent the basic meme metadata.

/// https://api.imgur.com/models/meme_metadata
@JsonSerializable()
class MemeMetadata implements BaseModel {
  /// The name of the meme used?
  @JsonKey(name: 'meme_name')
  String name;

  /// The top text of the meme.
  @JsonKey(name: 'top_text')
  String topText;

  /// The bottom text of the meme.
  @JsonKey(name: 'bottom_text')
  String bottomText;

  /// The image id of the background image of the meme.
  @JsonKey(name: 'bg_image')
  String bgImage;

  MemeMetadata({this.name, this.topText, this.bottomText, this.bgImage});

  factory MemeMetadata.fromJson(Map<String, dynamic> json) =>
      _$MemeMetadataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MemeMetadataToJson(this);
}
