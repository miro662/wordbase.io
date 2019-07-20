class Language {
  final String code;
  final String name;

  const Language(this.code, this.name);

  String get description => name;
}

class LanguagePair {
  final Language from;
  final Language to;

  const LanguagePair(this.from, this.to);

  LanguagePair withChangedFromLanguage(Language from) => LanguagePair(from, this.to);
  LanguagePair withChangedToLanguage(Language to) => LanguagePair(this.from, to);
}

