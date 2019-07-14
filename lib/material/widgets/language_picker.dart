import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:wordbase_io/models/language.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({
    Key key,
    this.language,
    this.availableLanguages,
    this.languagePicked,
  }) : super(key: key);

  final Language language;
  final List<Language> availableLanguages;
  final Function languagePicked;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: language,
      onChanged: (Language newLanguage) {
        this.languagePicked(newLanguage);
      },
      items: this.availableLanguages
        .map<DropdownMenuItem<Language>>((Language value) {
          return DropdownMenuItem<Language>(
            value: value,
            child: Text(value.description)
          );
        })
        .toList(),
    );
  }
}