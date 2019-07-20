import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordbase_io/material/dictionary.dart';
import 'package:wordbase_io/services/mock_dictionary_service.dart';

class WordbaseIOMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wordbase.io',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('wordbase.io'),
        ),
        body: DictionaryWidget(
          dictionaryService: MockDictionaryService()
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.translate),
              title: new Text('Dictionary'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.code),
              title: new Text('Learn'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings')
            )
          ],
        )
      ),
    );
  }
}