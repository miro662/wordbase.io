import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:wordbase_io/models/language.dart';

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({
    Key key,
    this.defaultLanguage,
    this.availableLanguages
  }) : super(key: key);

  final Language defaultLanguage;
  final List<Language> availableLanguages;

  @override
  _LanguagePickerState createState() {
    if (this.availableLanguages.contains(this.defaultLanguage)) {
      return _LanguagePickerState(this.defaultLanguage);
    } else {
      return _LanguagePickerState(this.availableLanguages[0]);
    }
  }
}

class _LanguagePickerState extends State<LanguagePicker> {
  Language selectedLanguage;

  _LanguagePickerState(Language language) {
    this.selectedLanguage = language;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: selectedLanguage,
      onChanged: (Language newLanguage) {
        setState(() {
          selectedLanguage = newLanguage;
        });
      },
      items: this.widget.availableLanguages
        .map<DropdownMenuItem<Language>>((Language value) {
          return DropdownMenuItem<Language>(
            value: value,
            child: Text(value.name)
          );
        })
        .toList(),
    );
  }
}