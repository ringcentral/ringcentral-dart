import 'package:ringcentral/ringcentral.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final rc = RingCentral(server: 'https://platform.ringcentral.com');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      // expect(awesome.isAwesome, isTrue);
    });
  });
}
