class StringCalculator {
  int add(String? numbers) {
    if (numbers == null || numbers.isEmpty) {
      return 0;
    }

    final parts = numbers.split(',');
    final numbersArray = parts.map((e) => int.tryParse(e) ?? 0); // error parsing ? then setting 0
    var sum = 0;
    numbersArray.forEach((n) => sum += n);
    return sum;
  }
}