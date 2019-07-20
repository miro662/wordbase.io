import 'package:wordbase_io/models/language.dart';
import 'package:wordbase_io/services/dictionary_service.dart';

class MockDictionaryService implements DictionaryService {
  static const languages = <Language>[
    Language('EN', 'English'),
    Language('PL', 'Polish'),
    Language('DE', 'German'),
  ];

  @override
  Future<Set<LanguagePair>> getAvailableLanguagePairs() async => Set.from(<LanguagePair>[
    LanguagePair(languages[0], languages[1]),
    LanguagePair(languages[0], languages[2]),
    LanguagePair(languages[1], languages[0]),
    LanguagePair(languages[2], languages[0]),
  ]);

  @override
  Future<List<String>> translate(String word, LanguagePair fromTo) async => <String>[
    "${word}_${fromTo.from.code}_${fromTo.to.code}_1",
    "${word}_${fromTo.from.code}_${fromTo.to.code}_2",
    "${word}_${fromTo.from.code}_${fromTo.to.code}_3",
  ];
}