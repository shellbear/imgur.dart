part of imgur.models;

/// The base model for a topic.
///
/// https://api.imgur.com/models/topic
@JsonSerializable()
class Topic implements BaseModel {
  /// ID of the topic.
  int id;

  /// Topic name.
  String name;

  /// Description of the topic.
  String description;

  /// CSS class used on website to style the ephemeral topic.
  String css;

  /// Whether it is an ephemeral (e.g. current events) topic.
  bool ephemeral;

  /// The top image in this topic.
  dynamic topPost;

  /// The current 'hero' image chosen by the Imgur community staff.
  Image heroImage;

  /// Whether the topic's heroImage should be used as the overall hero image.
  bool isHero;

  Topic({
    this.id,
    this.name,
    this.description,
    this.css,
    this.ephemeral,
    this.topPost,
    this.heroImage,
    this.isHero,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
