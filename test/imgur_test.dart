import 'package:imgur/imgur.dart';
import 'package:test/test.dart';

void main() {
  test('Invalid token', () {
    final client = Imgur(Authentication.fromToken('invalid'));

    client.account.getSettings().then((_) {
      assert(false, 'An error should occur');
    }).catchError((_) {
      assert(true, 'An error should occur');
    });
  });

  test('Invalid BaseResponse type', () {
    try {
      BaseResponse<int>.fromJson({
        'data': 'INVALID',
      });
    } catch (_) {
      assert(true, 'An error should occur');
    }
  });

  test('Invalid BaseResponseList type', () {
    try {
      BaseResponseList<int>.fromJson({
        'data': 'INVALID',
      });
    } catch (_) {
      assert(true, 'An error should occur');
    }
  });
}
