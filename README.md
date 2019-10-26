# imgur.dart

An [Imgur](https://imgur.com/) API Client Library that uses Imgur's v3 API for [Dart](https://dart.dev/).

[![pub package](https://img.shields.io/pub/v/imgur.svg)](https://pub.dev/packages/imgur)
[![workflow status](https://github.com/ShellBear/imgur.dart/workflows/Dart%20CI/badge.svg)](https://github.com/ShellBear/imgur.dart/actions?workflow=Dart+CI)

## Usage

A simple usage example to get your uploaded images:

```dart
import 'package:imgur/imgur.dart' as imgur;

main() async {
  final client = imgur.Imgur(imgur.Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Get your uploaded images
  final resp = await client.account.getImages();

  print(resp);
}

```

Upload an image:

```dart
import 'package:imgur/imgur.dart' as imgur;

main() async {
  final client = imgur.Imgur(imgur.Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  /// Upload an image from path
  await client.image
      .uploadImage(
          imagePath: '/path/of/the/image.png',
          title: 'A title',
          description: 'A description')
      .then((image) => print('Uploaded image to: ${image.link}'));
}
```

## Documentation

A generated documentation is available at [pub.dev](https://pub.dev/documentation/imgur/latest/).

## Testing

```sh
pub run test
```

## Contributing

You are interested in contributing please see the [CONTRIBUTING.md](CONTRIBUTING.md) file which will
tell you more about:

* Styling your contributions
* Submitting issues and/or pull requests

## Credits

* [IamBlueSlime](https://github.com/IamBlueSlime) - [TalkOpenSource](https://github.com/IamBlueSlime/TalkOpenSource/) for the project layout inspiration

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
