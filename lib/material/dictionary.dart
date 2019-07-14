import 'package:flutter/material.dart';
import 'package:wordbase_io/material/widgets/language_picker.dart';
import 'package:wordbase_io/models/language.dart';

class WordRequesterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WordRequesterWidgetState();
}

class _WordRequesterWidgetState extends State<WordRequesterWidget> {
  static const languages = <Language>[
    Language('EN', 'English'),
    Language('PL', 'Polish'),
    Language('DE', 'German'),
  ];

  String wordToTranslate = "";
  Language fromLanguage = languages[0];
  Language toLanguage = languages[1];

  void checkQuery() {
    if (wordToTranslate != "") {
      print(fromLanguage.code);
      print(toLanguage.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter word to translate'
            ),
            style: TextStyle(
              fontSize: 22
            ),
            onChanged: (content) => setState(() => wordToTranslate = content),
            onSubmitted: (content) => checkQuery()
          ),
          Row(
            children: <Widget>[
              LanguagePicker(
                availableLanguages: languages,
                language: fromLanguage,
                languagePicked: (language) {
                  setState(() {
                    if (toLanguage == language) {
                      print("from");
                      toLanguage = fromLanguage;
                    }
                    fromLanguage = language;
                  });
                  checkQuery();
                }
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Text('to')
              ),
              LanguagePicker(
                availableLanguages: languages,
                language: toLanguage,
                languagePicked: (language) {
                  setState(() {
                    if (fromLanguage == language) {
                      print("to");
                      fromLanguage = toLanguage;
                    }
                    toLanguage = language;
                  });
                  checkQuery();
                },
              )
            ],
          ),
        ],
      )
    );
  }
}

class DictionaryWidget extends StatelessWidget {
  static const languages = <Language>[
    Language('EN', 'English'),
    Language('PL', 'Polish'),
    Language('DE', 'German'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          WordRequesterWidget()
        ],
      )
    );
  }
}