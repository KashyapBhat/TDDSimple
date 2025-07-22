import 'package:simple_tdd/exception/negative_number_exception.dart';
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

  test('returns sum of two comma-separated numbers with risky new line', () {
    final calculator = StringCalculator();
    expect(calculator.add('1\n2,3'), 6);
  });

  test('returns sum of two comma-separated numbers negative', () {
    final calculator = StringCalculator();
    expect(
      () => calculator.add('1, -2, 3'),
      throwsA(
        predicate(
          (e) =>
              e is NegativeNumberException &&
              e.negativeNumbers.length == 1 &&
              e.negativeNumbers.contains(-2),
        ),
      ),
    );
  });

  test('returns sum of two custom separated numbers ', () {
    final calculator = StringCalculator();
    expect(calculator.add('//;\n1;2'), 3);
  });

  test(
    'returns sum of two custom-separated numbers where - is used to separate numbers',
    () {
      final calculator = StringCalculator();
      expect(
        () => calculator.add('//;\n1;-2'),
        throwsA(
          predicate(
            (e) =>
                e is NegativeNumberException &&
                e.negativeNumbers.length == 1 &&
                e.negativeNumbers.contains(-2),
          ),
        ),
      );
    },
  );

  test('Numbers bigger than 1000 should be ignored', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2000,3'), 4);
  });

  test('returns sum of multiple custom-separated numbers', () {
    final calculator = StringCalculator();
    expect(calculator.add('//[***]\n1***2***3'), 6);
  });

}
