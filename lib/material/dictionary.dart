import 'package:flutter/material.dart';
import 'package:wordbase_io/material/widgets/language_picker.dart';
import 'package:wordbase_io/models/language.dart';

class WordRequesterWidget extends StatelessWidget {
  static const languages = <Language>[
    Language('EN', 'English'),
    Language('PL', 'Polish'),
    Language('DE', 'German'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter word to translate'
            ),
            style: TextStyle(
              fontSize: 22
            ),
          ),
          Row(
            children: <Widget>[
              LanguagePicker(
                availableLanguages: languages,
                defaultLanguage: languages[0],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Text('to')
              ),
              LanguagePicker(
                availableLanguages: languages,
                defaultLanguage: languages[1],
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
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          WordRequesterWidget()
        ],
      )
    );
  }
}