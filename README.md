# imgur.dart

An [Imgur](https://imgur.com/) api client for [Dart](https://dart.dev/).

## Usage

A simple usage example to get your uploaded images:

```dart
import 'package:imgur/imgur.dart';

main() async {
  final client = Imgur(
      Authentication.fromToken('YOUR_IMGUR_ACCESS_TOKEN'));

  final resp = await client.account.getImages();
  print(resp.data);
}
```

## Documentation

A generated documentation is available on [GoDoc](https://godoc.org/github.com/ShellBear/go-blih).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
