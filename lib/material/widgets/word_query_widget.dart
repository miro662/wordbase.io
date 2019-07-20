import 'package:flutter/material.dart';
import 'package:wordbase_io/models/language.dart';
import 'package:wordbase_io/services/dictionary_service.dart';

import 'language_pair_picker.dart';

class WordQueryWidget extends StatefulWidget {
  const WordQueryWidget({
    Key key,
    this.onRequestChange,
    this.dictionaryService
  }) : super(key: key);

  final Function onRequestChange;
  final DictionaryService dictionaryService;

  @override
  State<StatefulWidget> createState() => _WordQueryWidgetState();
}

class _WordQueryWidgetState extends State<WordQueryWidget> {
  String wordToTranslate = "";
  LanguagePair languagePair;

  void checkQuery() {
    this.widget?.onRequestChange(wordToTranslate, languagePair);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Color.fromRGBO(240, 240, 240, 0.8),
      child: Column(
        children: <Widget>[
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Enter word to translate'
            ),
            style: TextStyle(
              fontSize: 22
            ),
            onChanged: (content) => setState(() => wordToTranslate = content),
            onSubmitted: (content) => checkQuery()
          ),
          FutureBuilder<Set<LanguagePair>>(
            future: widget.dictionaryService.getAvailableLanguagePairs(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                languagePair = snapshot.data.first;
                return LanguagePairPicker(
                  languagePairs: snapshot.data,
                  onPairChanged: (newPair) {
                    languagePair = newPair;
                    checkQuery();
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      )
    );
  }
}