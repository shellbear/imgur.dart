part of imgur.models;

/// This model is used to represent the basic account information.
/// https://api.imgur.com/models/account
@JsonSerializable()
class Account implements BaseModel {
  /// The account id for the username requested
  String id;

  /// The account username, will be the same as requested in the URL
  String url;

  /// A basic description the user has filled out
  String bio;

  /// The reputation for the account, in it's numerical format.
  double reputation;

  /// The time of account creation
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime created;

  /// False if not a pro user, their expiration date if they are.
  @JsonKey(name: 'pro_expiration')
  dynamic proExpiration;

  Account({
    this.id,
    this.url,
    this.bio,
    this.reputation,
    this.created,
    this.proExpiration,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
