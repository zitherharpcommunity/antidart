extension StringsExtension on String {
  String? get nullIfEmpty => isEmpty ? null : this;

  String? get nullIfBlank => isBlank() ? null : this;

  bool isBlank() => trim().isEmpty;

  String uppercase() => toUpperCase();

  String lowercase() => toLowerCase();
}