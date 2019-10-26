part of imgur.models;

/// The base model for a notification.
///
/// https://api.imgur.com/models/notification
@JsonSerializable()
class Notification implements BaseModel {
  /// The ID for the notification.
  int id;

  /// The Account ID for the notification.
  @JsonKey(name: 'account_id')
  int accountId;

  /// Has the user viewed the image yet?
  bool viewed;

  /// This can be any other model, currently only using comments and
  /// conversation metadata.
  dynamic content;

  Notification({this.id, this.accountId, this.viewed, this.content});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
