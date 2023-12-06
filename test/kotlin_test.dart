import 'package:antidart/kotlin.dart' hide test, expect;
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    val awesome = listOf([1, 2, 3]);

    setUp(() {
      // Additional setup goes here.
    });

    test('Unit Test', () {
      expect(awesome.length, 3);
    });
  });
}
