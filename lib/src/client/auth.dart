part of imgur.client;

const _AuthorizationUrlRegex =
    'access_token=(\\w+)&expires_in=(\\d+)&token_type=(\\w+)' +
        '&refresh_token=(\\w+)&account_username=(\\w+)&account_id=(\\d+)';

@JsonSerializable()
class Authentication {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'expires_in')
  String expiresIn;

  @JsonKey(name: 'token_type')
  String tokenType;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  @JsonKey(name: 'account_username')
  String accountUsername;

  @JsonKey(name: 'account_id')
  String accountId;

  @JsonKey(ignore: true)
  String clientId;

  Authentication({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
    this.accountUsername,
    this.accountId,
    this.clientId,
  });

  Authentication.anonymous();

  Authentication.fromAuthorization({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
    this.accountUsername,
    this.accountId,
  });

  Authentication.fromClientId(this.clientId);

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Authentication.fromToken(this.accessToken);

  Map<String, String> get headers {
    Map<String, String> headers = Map<String, String>();

    if (clientId != null && accessToken == null) {
      headers[HttpHeaders.authorizationHeader] = 'Client-ID ${clientId}';
    } else if (accessToken != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer ${accessToken}';
    }

    return headers;
  }

  bool get isAnonymous => accessToken == null && clientId == null;

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);

  static Authentication fromAuthorizationUrl(String url) {
    var regExp = RegExp(_AuthorizationUrlRegex);

    if (!regExp.hasMatch(url)) {
      throw ArgumentError('Authorization URL is invalid');
    }

    var match = regExp.firstMatch(url);
    return Authentication.fromAuthorization(
        accessToken: match.group(1),
        expiresIn: match.group(2),
        tokenType: match.group(3),
        refreshToken: match.group(4),
        accountUsername: match.group(5),
        accountId: match.group(6));
  }
}
