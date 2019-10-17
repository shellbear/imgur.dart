import 'package:imgur/imgur.dart';

main() async {
  final client = Imgur(
      Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  final resp = await client.account.getImages();
  print(resp.data);
}
