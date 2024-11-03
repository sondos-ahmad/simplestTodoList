import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final bool check;
  final Function(bool?)? onChanged;
  final Function () deleteTask ;

  TodoCard(this.title, this.check, this.onChanged,this.deleteTask);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                    fontWeight: FontWeight.w500,
                    decoration: check
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Row(
                children: [
                  Checkbox(value: check, onChanged: onChanged),
                  IconButton(onPressed: deleteTask, icon: Icon(Icons.delete,)),
                ],
              ),

        ]
        ),
        ),
      ),
    );
  }
}
