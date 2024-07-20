extension NumNullableExtensions on num? {
  bool isNullOrZero() {
    return this == null || this == 0;
  }
}

extension ListNullableExtensions<T> on List<T>? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
