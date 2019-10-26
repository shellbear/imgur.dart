part of imgur.models;

/// The base model for a conversation.
///
/// https://api.imgur.com/models/conversation
@JsonSerializable()
class Conversation implements BaseModel {
  /// Conversation ID.
  int id;

  /// Preview of the last message.
  @JsonKey(name: 'last_message_preview')
  String lastMessagePreview;

  /// Time of last sent message.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// Account ID of the other user in conversation.
  @JsonKey(name: 'with_account_id')
  int withAccountId;

  /// Account username of the other user in conversation.
  @JsonKey(name: 'with_account')
  String withAccount;

  /// Total number of messages in the conversation.
  @JsonKey(name: 'message_count')
  int messageCount;

  /// OPTIONAL: Reverse sorted such that most recent message is at the end of
  /// the array.
  ///
  /// Only available when requesting a specific conversation.
  @JsonKey(nullable: true)
  List<Message> messages;

  /// OPTIONAL: Flag to indicate whether you've reached the beginning of the
  /// thread.
  ///
  /// Only available when requesting a specific conversation.
  @JsonKey(nullable: true)
  bool done;

  /// OPTIONAL: Number of the next page.
  ///
  /// Only available when requesting a specific conversation.
  @JsonKey(nullable: true)
  int page;

  Conversation(
      {this.id,
      this.lastMessagePreview,
      this.datetime,
      this.withAccountId,
      this.withAccount,
      this.messageCount,
      this.messages,
      this.done,
      this.page});

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
