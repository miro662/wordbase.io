import 'package:flutter/material.dart';
import 'package:wordbase_io/material/widgets/word_list.dart';
import 'package:wordbase_io/material/widgets/word_query_widget.dart';
import 'package:wordbase_io/models/language.dart';
import 'package:wordbase_io/services/dictionary_service.dart';


class DictionaryWidget extends StatefulWidget {
  final DictionaryService dictionaryService;

  const DictionaryWidget({
    Key key,
    this.dictionaryService
  }) : super(key: key);

  @override
  _DictionaryWidgetState createState() => _DictionaryWidgetState();
}
class _DictionaryWidgetState extends State<DictionaryWidget> {
  LanguagePair pair;
  String word;
  Future<List<String>> meanings;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(210, 210, 210, 1.0),
      child: Column(
        children: <Widget>[
          WordQueryWidget(
            onRequestChange: (word, pair) {
              setState(() {
                this.word = word;
                this.pair = pair;
                if (this.word == '') {
                  this.meanings = Future.value([]);
                } else if (this.pair != null) {
                  this.meanings = widget.dictionaryService.translate(word, pair);
                }
              });
            },
            dictionaryService: this.widget.dictionaryService,
          ),
          FutureBuilder<List<String>>(
            future: meanings,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return WordList(words: snapshot.data);
              } else {
                return Container();
              }
            }
          )
        ],
      )
    );
  }
}