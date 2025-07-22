class StringCalculator {
  int add(String? input) {
    if (input == null || input.isEmpty) return 0;

    String delimiterPattern = _delimiterPattern(input);
    String numbers = _removeDelimiterPrefix(input);
    final parts = numbers.split(RegExp(delimiterPattern));

    // error parsing ? then setting 0
    final numbersArray = parts.map((e) => int.tryParse(e) ?? 0);
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
