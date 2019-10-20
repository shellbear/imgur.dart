// GENERATED CODE - DO NOT MODIFY BY HAND

part of imgur.client;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) {
  return Authentication(
    accessToken: json['access_token'] as String,
    expiresIn: json['expires_in'] as String,
    tokenType: json['token_type'] as String,
    refreshToken: json['refresh_token'] as String,
    accountUsername: json['account_username'] as String,
    accountId: json['account_id'] as String,
  );
}

Map<String, dynamic> _$AuthenticationToJson(Authentication instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'account_username': instance.accountUsername,
      'account_id': instance.accountId,
    };
