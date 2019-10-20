import 'package:imgur/imgur.dart';

main() async {
  final client = Imgur(Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Upload an image from path
  await client.image
      .uploadImage(
          imagePath: '/path/of/the/image.png',
          title: 'A title',
          description: 'A description')
      .then((resp) => print('Uploaded image to: ${resp.data.link}'));
}
