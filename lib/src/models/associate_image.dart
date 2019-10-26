part of imgur.models;

/// A model representing associate image method's response.
@JsonSerializable()
class AssociateImage implements BaseModel {
  /// Number of updated images.
  @JsonKey(name: 'images_updated')
  int imagesUpdated;

  AssociateImage({this.imagesUpdated});

  factory AssociateImage.fromJson(Map<String, dynamic> json) =>
      _$AssociateImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssociateImageToJson(this);
}
