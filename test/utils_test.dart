import 'package:imgur/imgur.dart';
import 'package:test/test.dart';

enum CustomEnum { yes, no }

void main() {
  test('Utils', () {
    assert(fmtType(CustomEnum.yes) == 'yes');
    assert(fmtType(CustomEnum.no) == 'no');
  });
}
