import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp is built");
    return MaterialApp(
      title: 'InheritedWidgetSample',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: MyWidget(title: 'InheritedWidget'),
  );
  }
}

class MyWidget extends StatefulWidget {
  final String title;

  MyWidget({Key key, this.title}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ImportantData importantData = ImportantData();

  _doImportantThings() {
    setState(() {
      importantData.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("MyWidget is build");
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("MyWidget"),
            AnotherWidget(importantData: importantData)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _doImportantThings,
        tooltip: 'Increment',
        child: Icon(Icons.add), 
      ),
      backgroundColor: Colors.green,
    );
  }
}

class ImportantData {
  int count = 0;
  increment() {
    this.count++;
  }
}

class AnotherWidget extends StatefulWidget {
  final ImportantData importantData;

  AnotherWidget({Key key, @required this.importantData})
      : assert(importantData != null),
      super(key: key);

  @override
  _AnotherWidgetState createState() => _AnotherWidgetState();
}

class _AnotherWidgetState extends State<AnotherWidget> {
  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    debugPrint("AnotherWidget is build");
    return Container(
      height: 400,
      decoration: BoxDecoration(color: Colors.cyan),
      child: Column(children: <Widget>[
        Text("AnotherWidget"),
        YetAnotherWidget(importantData: _importantData)
      ])
    );
  }
}

class YetAnotherWidget extends StatefulWidget {
  final ImportantData importantData;

  YetAnotherWidget({Key key, @required this.importantData})
      : assert(importantData != null),
      super(key: key);

  @override
  _YetAnotherWidgetState createState() => _YetAnotherWidgetState();
}

class _YetAnotherWidgetState extends State<YetAnotherWidget> {
  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    debugPrint("YetAnotherWidget is build");
    return Container(
      height: 300,
      decoration: BoxDecoration(color: Colors.amber),
      child: Column(children: <Widget>[
        Text("YetAnotherWidget"),
        ThisIsJustRidiculousWidget(importantData: _importantData)
      ])
    );
  }
}

class ThisIsJustRidiculousWidget extends StatefulWidget {
  final ImportantData importantData;

  ThisIsJustRidiculousWidget({Key key, @required this.importantData})
      : assert(importantData != null),
      super(key: key);

  @override
  _ThisIsJustRidiculousWidgetState createState() => _ThisIsJustRidiculousWidgetState();
}

class _ThisIsJustRidiculousWidgetState extends State<ThisIsJustRidiculousWidget> {
  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    debugPrint("ThisIsJustRidiculousWidget is build");
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.deepPurpleAccent),
      child: Column(children: <Widget>[
        Text("ThisIsJustRidiculousWidget"),
        Text("importantData is ${_importantData.count}")
      ])
    );
  }
}



