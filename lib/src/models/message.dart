part of imgur.models;

/// The base model for a message.
///
/// https://api.imgur.com/models/message
@JsonSerializable()
class Message implements BaseModel {
  /// The ID for the message.
  int id;

  /// Account username of person sending the message.
  String from;

  /// The account ID of the person receiving the message.
  @JsonKey(name: 'account_id')
  int accountId;

  /// The account ID of the person who sent the message.
  @JsonKey(name: 'sender_id')
  int senderId;

  /// Text of the message.
  String body;

  /// ID for the overall conversation.
  @JsonKey(name: 'conversation_id')
  int conversationId;

  /// Time message was sent.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  Message({
    this.id,
    this.from,
    this.accountId,
    this.senderId,
    this.body,
    this.conversationId,
    this.datetime,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
