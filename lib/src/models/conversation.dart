part of imgur.models;

/// The base model for a conversation.
/// https://api.imgur.com/models/conversation
@JsonSerializable()
class Conversation implements BaseModel {
  /// Conversation ID
  int id;

  /// Preview of the last message
  @JsonKey(name: 'last_message_preview')
  String lastMessagePreview;

  /// Time of last sent message
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime datetime;

  /// Account ID of the other user in conversation
  @JsonKey(name: 'with_account_id')
  int withAccountId;

  /// Account username of the other user in conversation
  @JsonKey(name: 'with_account')
  String withAccount;

  /// Total number of messages in the conversation
  @JsonKey(name: 'message_count')
  int messageCount;

  /// OPTIONAL: (only available when requesting a specific conversation) Reverse sorted such that most recent message is at the end of the array
  @JsonKey(nullable: true)
  List<Message> messages;

  /// OPTIONAL: (only available when requesting a specific conversation) Flag to indicate whether you've reached the beginning of the thread
  @JsonKey(nullable: true)
  bool done;

  /// OPTIONAL: (only available when requesting a specific conversation) Number of the next page
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
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
