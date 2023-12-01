enum Language {
  Russian,
  Kyrgyz,
  English,
}

extension LanguageExtension on Language {
  String get displayName {
    switch (this) {
      case Language.Russian:
        return 'Русский';
      case Language.Kyrgyz:
        return 'Кыргызча';
      case Language.English:
        return 'English';
    }
  }
}
