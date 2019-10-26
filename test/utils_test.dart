import 'package:imgur/imgur.dart';
import 'package:test/test.dart';

enum CustomEnum { yes, no }

void main() {
  test('Utils', () {
    assert(fmtType(CustomEnum.yes) == 'yes', 'Result should be yes');
    assert(fmtType(CustomEnum.no) == 'no', 'Result should be no');
  });
}
