part of imgur.client;

const _AuthorizationUrlRegex =
    'access_token=(\\w+)&expires_in=(\\d+)&token_type=(\\w+)' +
        '&refresh_token=(\\w+)&account_username=(\\w+)&account_id=(\\d+)';

class Authentication {
  String accessToken;
  String expiresIn;
  String tokenType;
  String refreshToken;
  String accountUsername;
  String accountId;
  String clientId;

  Authentication(this.accessToken, this.expiresIn, this.tokenType,
      this.refreshToken, this.accountUsername, this.accountId);
  Authentication.fromToken(this.accessToken);
  Authentication.fromClientId(this.clientId);
  Authentication.anonymous();

  Authentication.fromAuthorizationUrl(String url) {
    var regExp = RegExp(_AuthorizationUrlRegex);

    if (regExp.hasMatch(url)) {
      var match = regExp.firstMatch(url);

      refresh({
        'access_token': match.group(1),
        'expires_in': match.group(2),
        'token_type': match.group(3),
        'refresh_token': match.group(4),
        'account_username': match.group(5),
        'account_id': match.group(6),
      });
    } else {
      throw ArgumentError('Authorization URL is invalid');
    }
  }

  Authentication.fromJson(Map<String, String> input) {
    refresh(input);
  }

  void refresh(Map<String, String> input) {
    accessToken = input['access_token'];
    expiresIn = input['expires_in'];
    tokenType = input['token_type'];
    refreshToken = input['refresh_token'];
    accountUsername = input['account_username'];
    accountId = input['account_id'];
  }

  bool get isAnonymous => accessToken == null || accessToken.isEmpty;
}
