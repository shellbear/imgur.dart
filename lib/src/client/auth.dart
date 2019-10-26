part of imgur.client;

const String _authorizationRegexUrl =
    'access_token=(\\w+)&expires_in=(\\d+)&token_type=(\\w+)'
    '&refresh_token=(\\w+)&account_username=(\\w+)&account_id=(\\d+)';

/// A class used to authenticate user on every API request.
@JsonSerializable()
class Authentication {
  @JsonKey(name: 'access_token')
  String _accessToken;

  @JsonKey(name: 'expires_in')
  // ignore: unused_field
  String _expiresIn;

  @JsonKey(name: 'token_type')
  // ignore: unused_field
  String _tokenType;

  @JsonKey(name: 'refresh_token')
  String _refreshToken;

  @JsonKey(name: 'account_username')
  // ignore: unused_field
  String _accountUsername;

  @JsonKey(name: 'account_id')
  // ignore: unused_field
  String _accountId;

  @JsonKey(ignore: true)
  String _clientId;

  /// The default Authentication constructor.
  Authentication({
    String accessToken,
    String expiresIn,
    String tokenType,
    String refreshToken,
    String accountUsername,
    String accountId,
    String clientId,
  })  : _accessToken = accessToken,
        _expiresIn = expiresIn,
        _tokenType = tokenType,
        _refreshToken = refreshToken,
        _accountUsername = accountUsername,
        _accountId = accountId,
        _clientId = clientId;

  /// Initialize an Authentication instance for non connected user.
  Authentication.anonymous();

  /// Generate authentication from an OAuth2 authorization response.
  Authentication.fromAuthorization({
    String accessToken,
    String expiresIn,
    String tokenType,
    String refreshToken,
    String accountUsername,
    String accountId,
  })  : _accessToken = accessToken,
        _expiresIn = expiresIn,
        _tokenType = tokenType,
        _refreshToken = refreshToken,
        _accountUsername = accountUsername,
        _accountId = accountId;

  /// Authentication from user's client id.
  Authentication.fromClientId(this._clientId);

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  /// Authentication from user's access token.
  Authentication.fromToken(this._accessToken);

  /// Get authentication headers.
  Map<String, String> get headers {
    final headers = <String, String>{};

    if (_clientId != null && _accessToken == null) {
      headers[HttpHeaders.authorizationHeader] = 'Client-ID $_clientId';
    } else if (_accessToken != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $_accessToken';
    }

    return headers;
  }

  /// Is user connected or not.
  bool get isAnonymous => _accessToken == null && _clientId == null;

  /// Refresh token if possible.
  Future<void> refresh() async {
    if (isAnonymous || _refreshToken == null) {
      return Future<void>.error(
          'You can\'t refresh token if you\'re not connected or refreshToken'
          'is empty.');
    }

    final resp = await http.Client().post('https://api.imgur.com/oauth2/token',
        body: toJson().cast<String, String>());

    if (resp.statusCode != 200) {
      return Future<void>.error(
          'Error refreshing access token! ${resp.statusCode}');
    }

    _accessToken = Authentication.fromJson(json.decode(resp.body))._accessToken;
  }

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);

  Authentication fromAuthorizationUrl(String url) {
    final regExp = RegExp(_authorizationRegexUrl);

    if (!regExp.hasMatch(url)) {
      throw ArgumentError('Authorization URL is invalid');
    }

    final match = regExp.firstMatch(url);
    return Authentication.fromAuthorization(
      accessToken: match.group(1),
      expiresIn: match.group(2),
      tokenType: match.group(3),
      refreshToken: match.group(4),
      accountUsername: match.group(5),
      accountId: match.group(6),
    );
  }
}
