import 'package:flutter/material.dart';
import './View/todoCard.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final _controller =TextEditingController();
  List todo = [
  ];

  void onChanged(index) {
    setState(() {

      todo[index][1] = !todo[index][1];
    });
  }
  void deleteTask(index){
    setState(() {
      todo.removeAt(index);
    });
  }
  void addTask (value) {
    setState(() {
      todo.add([value, false]);
      _controller.clear();
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('TodoList')),),
        body: ListView.builder(
            itemCount: todo.length,
            itemBuilder: ((BuildContext context, index) {
              return TodoCard(
                  todo[index][0], todo[index][1], (value) => onChanged(index),
                  ()=>deleteTask(index));
            })),
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add your Task",
                    border: OutlineInputBorder()
                  ),
                  controller: _controller,
                ),
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
            onPressed: (){addTask(_controller.text);})
          ],
        )

    ),
    );
  }
}
