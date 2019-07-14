import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toodoo/models/todo_model.dart';
import 'package:toodoo/widgets/todo_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _todoItems = [];

  void _addTodoItem() {
    // Putting our code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  Container get _topSummary => Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        height: 200,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.green.shade100,
        ),
        child: Text("Summary", style: TextStyle(fontSize: 30)),
      );

  Widget get _todoList => ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _topSummary;
          }
          if (index < _todoItems.length) {
            return GestureDetector(
                child: _buildTodoItem(index),
                onTap: () => _removeTodoItem(index),
              );
          }
        },
      );

  Widget _buildTodoItem(int index) {
    return TodoWidget(Todo(_todoItems[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Container(
              child: _todoList,
              )
            ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodoItem,
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }
}