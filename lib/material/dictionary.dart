import 'package:flutter/material.dart';
import 'package:wordbase_io/material/widgets/word_query_widget.dart';
import 'package:wordbase_io/models/language.dart';
import 'package:wordbase_io/services/mock_dictionary_service.dart';

class DictionaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          WordQueryWidget(
            onRequestChange: (word, pair) => print("${word} ${pair.from.description} -> ${pair.to.description}"),
            dictionaryService: MockDictionaryService(),
          )
        ],
      )
    );
  }
}