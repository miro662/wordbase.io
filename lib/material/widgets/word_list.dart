import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  final List<String> words; 

  const WordList({
    Key key,
    this.words
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Text(words.join(", ")); 
    return Container(
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: words.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            words[index],
            style: TextStyle(fontSize: 16),
          ),
          trailing: IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () => print("xD"),
          ),
        ),
        separatorBuilder: (context, index) => Divider(height: 1.0,),
      ),
    );
  }
}