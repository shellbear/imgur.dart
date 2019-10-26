part of imgur.models;

/// The account settings, only accessible if you're logged in as the user.
///
/// https://api.imgur.com/models/account_settings
@JsonSerializable()
class AccountSettings implements BaseModel {
  /// The account username.
  @JsonKey(name: 'account_url')
  String accountUrl;

  /// The users email address.
  String email;

  /// Automatically allow all images to be publicly accessible.
  @JsonKey(name: 'public_images')
  bool publicImages;

  /// Set the album privacy to this privacy setting on creation.
  @JsonKey(name: 'album_privacy')
  String albumPrivacy;

  /// False if not a pro user, their expiration date if they are.
  @JsonKey(name: 'pro_expiration')
  dynamic proExpiration;

  /// True if the user has accepted the terms of uploading to the Imgur gallery.
  @JsonKey(name: 'accepted_gallery_terms')
  bool acceptedGalleryTerms;

  /// The email addresses that have been activated to allow uploading.
  @JsonKey(name: 'active_emails')
  List<String> activeEmails;

  /// If the user is accepting incoming messages or not.
  @JsonKey(name: 'messaging_enabled')
  bool messagingEnabled;

  /// An array of users that have been blocked from messaging.
  @JsonKey(name: 'blocked_users', toJson: baseModelListToJson)
  List<BlockedUser> blockedUsers;

  /// True if the user has opted to have mature images displayed in gallery
  /// list endpoints.
  @JsonKey(name: 'show_mature')
  bool showMature;

  /// True unless the user created their account via a third party service.
  @JsonKey(name: 'first_party')
  bool firstParty;

  AccountSettings({
    this.accountUrl,
    this.email,
    this.publicImages,
    this.albumPrivacy,
    this.proExpiration,
    this.acceptedGalleryTerms,
    this.activeEmails,
    this.messagingEnabled,
    this.blockedUsers,
    this.showMature,
    this.firstParty,
  });

  factory AccountSettings.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountSettingsToJson(this);
}
