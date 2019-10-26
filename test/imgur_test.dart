import 'package:test/test.dart';
import 'package:imgur/imgur.dart';

void main() {
  test('Invalid token', () {
    final client = Imgur(Authentication.fromToken('invalid'));

    client.account.getSettings().then((_) {
      assert(false);
    }).catchError((_) {
      assert(true);
    });
  });

  test('Invalid BaseResponse type', () {
    try {
      BaseResponse<int>.fromJson({
        'data': 'INVALID',
      });
    } catch (_) {
      assert(true);
    }
  });

  test('Invalid BaseResponseList type', () {
    try {
      BaseResponseList<int>.fromJson({
        'data': 'INVALID',
      });
    } catch (_) {
      assert(true);
    }
  });
}
