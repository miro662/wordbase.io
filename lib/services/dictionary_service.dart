import 'package:wordbase_io/models/language.dart';

abstract class DictionaryService {
  Future<Set<LanguagePair>> getAvailableLanguagePairs();
  Future<List<String>> translate(String word, LanguagePair fromTo);
}