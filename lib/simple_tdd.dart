import 'package:simple_tdd/exception/negative_number_exception.dart';

class StringCalculator {
  int add(String? input) {
    if (input == null || input.isEmpty) return 0;

    String delimiterPattern = _delimiterPattern(input);
    String numbers = _removeDelimiterPrefix(input);
    final parts = numbers.split(RegExp(delimiterPattern));

    // error parsing ? then setting 0
    final numbersArray = parts.map((e) => int.tryParse(e) ?? 0).where((n) => n <= 1000);

    final negativeNumbers = numbersArray.where((n) => n < 0).toList(); // Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2

    if (negativeNumbers.isNotEmpty) {
      throw NegativeNumberException(negativeNumbers);
    }

    var sum = 0;
    numbersArray.forEach((n) => sum += n);
    return sum;
  }

  String _delimiterPattern(String input) {
    const defaultPattern = r'[,\n]';

    if (!input.startsWith('//')) {
      return defaultPattern;
    }

    final delimiterMatch = RegExp(r'^//(.+)\n').firstMatch(input);
    if (delimiterMatch == null || delimiterMatch.groupCount != 1) {
      throw FormatException('Invalid custom delimiter format');
    }

    final customDelimiter = RegExp.escape(delimiterMatch.group(1)!);
    return '[$customDelimiter\n]';
  }

  String _removeDelimiterPrefix(String input) {
    if (!input.startsWith('//')) return input;

    final newlineIndex = input.indexOf('\n');
    if (newlineIndex == -1) {
      throw FormatException('Missing newline after delimiter declaration');
    }
    return input.substring(newlineIndex + 1);
  }
}
