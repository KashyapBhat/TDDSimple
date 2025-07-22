class NegativeNumberException implements Exception {
  final List<int> negativeNumbers;

  NegativeNumberException(this.negativeNumbers);

  @override
  String toString() {
    return 'Negative numbers not allowed: ${negativeNumbers.join(',')}';
  }
}
