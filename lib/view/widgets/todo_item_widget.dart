import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoitem = Provider.of<ToDoItemController>(context);
    final _textController = TextEditingController(text: todoitem.todoText);
    
    double w = MediaQuery.of(context).size.width - 20;
    return Container(
      child: Column(
        children: [
          Observer(
            builder: (_) => Row(
              children: [
                Transform.scale(
                  scale: 1.33,
                  child: Checkbox(
                      checkColor: Colors.white,
                      // activeColor: ListColor.of(context).color.withOpacity(0.5),
                      activeColor: todoitem.color.withOpacity(0.3),
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      side: BorderSide(color: Colors.white.withOpacity(0.5)),
                      value: todoitem.completed,
                      shape: const CircleBorder(),
                      onChanged: (bool? value) => todoitem.toggleCompleted()),
                ),
                // Text(todoitem.todoText,
                //     style: Theme.of(context).textTheme.headline2)
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (value) {
                      todoitem.setToDoText(value);
                    },
                    style: Theme.of(context).textTheme.headline2,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16.0, 0, 0, 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: todoitem.color.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
