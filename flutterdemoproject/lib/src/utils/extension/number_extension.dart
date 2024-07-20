enum ComparisonResult {
  failed,
  lessThan,
  equal,
  greaterThan
}

extension DoubleComparison on double {
  ComparisonResult compareTo(double other) {
    if (this > other) {
      return ComparisonResult.greaterThan;
    } else if (this < other) {
      return ComparisonResult.lessThan;
    } else {
      return ComparisonResult.equal;
    }
  }
}

extension IntComparison on int {
  ComparisonResult compareTo(int other) {
    if (this > other) {
      return ComparisonResult.greaterThan;
    } else if (this < other) {
      return ComparisonResult.lessThan;
    } else {
      return ComparisonResult.equal;
    }
  }
}