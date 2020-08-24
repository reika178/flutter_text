import 'package:flutter/material.dart';

// class Todo {
//   final String title;
//   final String description;

//   Todo({ @required this.title, @required this.description})
//     : assert(title != null),
//     assert(description != null);
// }

// void main() => runApp(MaterialApp(
//   title: 'Navigation',
//   home: TodoScreen(
//     todos: List<Todo>.generate(20, (i) => Todo(
//       title: 'TODO $i',
//       description: 'TODO $i の詳細',
//     )),
//   ),
// ));

// class TodoScreen extends StatelessWidget {
//   final List<Todo> _todos;

//   TodoScreen({ Key key, @required List<Todo> todos })
//     : assert(todos != null),
//       this._todos = todos,
//       super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text('TODOリスト'),
//     ),
//     body: ListView.builder(
//       itemCount: _todos.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(_todos[index].title),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailScreen(todo: _todos[index]),
//             ),
//           );
//         }
//       ),  
//     ),
//   );
// }

// class DetailScreen extends StatelessWidget {
//   final Todo _todo;

//   DetailScreen({ Key key, @required Todo todo})
//     : assert(todo != null),
//       this._todo = todo,
//       super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text('_todo.title'),
//     ),
//     body: Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Text('_todo.description')
//     ),
//   );
// }

void main() => runApp(MaterialApp(
  title: 'Navigation',
  home: HomeScreen(),
));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Demo'),
    ),
    body: Center(child: SelectionButton()),
  );
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RaisedButton(
    onPressed: () {

      _navigateAndDisplaySelection(context);
    },
    child: Text('オプションを選択'),
  );

  void _navigateAndDisplaySelection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('選択してください'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context, '選択肢１');
              },
              child: Text('選択肢１'),
              ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context, '選択肢２');
              },
              child: Text('選択肢２'),
              ),
          ),
        ],
      )
    )
  );
}

Future<void> _navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectionScreen()),
  );

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(result)));
}