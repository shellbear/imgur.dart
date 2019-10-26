import 'package:imgur/imgur.dart' as imgur;

main() async {
  final client =
      imgur.Imgur(imgur.Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Get your uploaded images
  final resp = await client.account.getImages();

  print(resp);
}
