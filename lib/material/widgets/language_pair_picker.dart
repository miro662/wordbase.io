import 'package:flutter/material.dart';
import 'package:wordbase_io/models/language.dart';

import 'language_picker.dart';

class LanguagePairPicker extends StatefulWidget {
  final Set<LanguagePair> languagePairs;
  final Function onPairChanged;

  const LanguagePairPicker({
    Key key,
    this.languagePairs,
    this.onPairChanged
  }) : super(key: key);

  @override
  _LanguagePairPickerState createState() => _LanguagePairPickerState(languagePairs.first);
}

class _LanguagePairPickerState extends State<LanguagePairPicker> {
  LanguagePair languagePair;

  _LanguagePairPickerState(this.languagePair);

  Set<Language> get availableFrom => Set.from(
    widget.languagePairs
    .map((pair) => pair.from)
  );

  Set<Language> get currentlyAvailableFrom => Set.from(
    widget.languagePairs
    .where((pair) => pair.to == languagePair.to)
    .map((pair) => pair.from)
  );

  Set<Language> get availableTo => Set.from(
    widget.languagePairs
    .where((pair) => pair.from == languagePair.from)
    .map((pair) => pair.to)
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        LanguagePicker(
          availableLanguages: availableFrom.toList(),
          language: languagePair.from,
          languagePicked: (language) {
            setState(() {
              languagePair = languagePair.withChangedFromLanguage(language);
              if (!currentlyAvailableFrom.contains(language)) {
                languagePair = languagePair.withChangedToLanguage(availableTo.first);
              }
              widget.onPairChanged(languagePair);
            });
          }
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Text('to')
        ),
        LanguagePicker(
          availableLanguages: availableTo.toList(),
          language: languagePair.to,
          languagePicked: (language) {
            setState(() {
              languagePair = this.languagePair.withChangedToLanguage(language);
            });
            widget.onPairChanged(languagePair);
          },
        )
      ],
    );
  }
}