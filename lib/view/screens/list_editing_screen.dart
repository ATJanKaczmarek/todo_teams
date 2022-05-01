import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/list_editing_screen_controller.dart';
import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/view/widgets/todo_item_widget.dart';

class ListEditingScreen extends StatelessWidget {
  ListEditingScreen({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();
  void _scrollDown(int itemsInList) {
    itemsInList < 9
        ? _controller.animateTo(_controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn)
        : _controller.animateTo(_controller.position.maxScrollExtent + 57.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    var listEditingScreen = Provider.of<ListEditingScreenController>(context);
    var item = ToDoItem();
    return Scaffold(
      body: ListView(
        controller: _controller,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                Text("\"" + listEditingScreen.passedToDoList.name + "\"")
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Observer(
                  builder: (_) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listEditingScreen.passedToDoList.todos.length,
                    itemBuilder: (_, index) => Provider<ToDoItemController>(
                      create: (_) => ToDoItemController(
                          todoText: listEditingScreen
                              .passedToDoList.todos[index].todoText,
                          completed: false,
                          color: listEditingScreen.passedToDoList.color,
                          uid:
                              listEditingScreen.passedToDoList.todos[index].uid,
                          // onSaveChanges: listEditingScreen.passedToDoList.updateListWithNewValue
                          onSaveChanges:
                              listEditingScreen.updateListAfterChange),
                      child: item,
                    ),
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.alphaBlend(
                  listEditingScreen.passedToDoList.color.withOpacity(0.3),
                  Theme.of(context).primaryColor),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            margin: const EdgeInsets.only(left: 21.0, top: 30.0, bottom: 30.0),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  listEditingScreen.passedToDoList.createTodo();
                  _scrollDown(listEditingScreen.passedToDoList.todos.length);
                  listEditingScreen.passedToDoList.updateList();
                },
                icon: const Icon(Icons.add),
                color: Colors.white,
                splashRadius: 25,
                iconSize: 25,
              ),
              backgroundColor:
                  listEditingScreen.passedToDoList.color.withOpacity(0.3),
              radius: 25,
            ),
          ),
        ],
      ),
    );
  }
}
