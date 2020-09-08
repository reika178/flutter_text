import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Event {
  final String id;
  final String title;
  final String description;
  final Datatime date ;
  final String imageUrl;
  final User owner ;

  Event(
    
  )
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
      home: Scaffold(
        appBar: AppBar(title: Text('InheritedWidget')),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("MyWidget"),
              MyWidget(key: myWidgetState),
              NoRefToImportantDataWidget()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            myWidgetState.currentState.doImportantThings();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          ),
          backgroundColor: Colors.green,
      )
  );
  }
}

class MyWidget extends StatefulWidget {
  final String title;

  MyWidget({Key key, this.title}) : super(key: key);

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  ImportantData importantData = ImportantData();

  doImportantThings() {
    setState(() {
      importantData.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("MyWidget is build");
    return AnotherWidget(importantData: importantData);
  }
}

