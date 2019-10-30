import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobx_demo/store/counter.dart';

void main() {
  Counter _counter;

  setUp(() => _counter = Counter());

  group('Counter Store', () {
    test('Counter starts with zero value', () {
      expect(_counter.value, 0);
    });

    test('Counter incremented', () {
      _counter.increment();
      expect(_counter.value > 0, isTrue);
    });
  });
}