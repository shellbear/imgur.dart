import 'package:imgur/imgur.dart' as imgur;

main() async {
  final client =
      imgur.Imgur(imgur.Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Upload an image from path
  await client.image
      .uploadImage(
          imagePath: '/path/of/the/image.png',
          title: 'A title',
          description: 'A description')
      .then((image) => print('Uploaded image to: ${image.link}'));
}
