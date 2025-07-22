import 'package:simple_tdd/simple_tdd.dart';
import 'package:test/test.dart';

void main() {
  test('should returns 0 for null string', () {
    final calculator = StringCalculator();
    expect(calculator.add(null), 0);
  });

  test('should returns 0 for empty string', () {
    final calculator = StringCalculator();
    expect(calculator.add(''), 0);
  });

  test('returns number when single number is passed', () {
    final calculator = StringCalculator();
    expect(calculator.add('1'), 1);
  });

  test('returns sum of two comma-separated numbers', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,5'), 6);
  });
}
