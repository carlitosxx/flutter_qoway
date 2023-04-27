// ignore_for_file: prefer_const_constructors
import 'package:security/security.dart';
import 'package:test/test.dart';

void main() {
  group('Security', () {
    test('can be instantiated', () {
      expect(Security(), isNotNull);
    });
  });
}
