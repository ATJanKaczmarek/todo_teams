import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/list_batch_controller.dart';
import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/view/widgets/list_batch_widget.dart';
import 'package:todo_teams/view/widgets/todo_item_widget.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todolist = Provider.of<ToDoListController>(context);
    todolist.onInit();
    return Column(
      children: [
        Builder(
            builder: (_) => Provider<ListBatchController>(
                  create: (_) => ListBatchController(
                      text: todolist.name,
                      color: todolist.color,
                      icon: Icons.wheelchair_pickup),
                  child: const ListBatch(),
                )),
        Observer(
          builder: (_) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 17,
                  child: Transform.scale(
                    scale: -((todolist.xPos - 0) / (0 - 90)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      // curve: Curves.elasticOut,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: todolist.color.withOpacity(0.3),
                        child: IconButton(
                          onPressed: () {todolist.navigateToEditingScreen(context);},
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          splashRadius: 21,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  transform: Matrix4.translationValues(todolist.xPos, 0, 0),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      todolist.updateX(details.delta.dx);
                    },
                    onHorizontalDragEnd: (details) {
                      todolist.snap();
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Observer(
                            builder: (_) => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: todolist.todos.length,
                              itemBuilder: (_, index) =>
                                  Provider<ToDoItemController>(
                                create: (_) => ToDoItemController(
                                    todoText: todolist.todos[index].todoText,
                                    completed: false,
                                    color: todolist.color,
                                    onSaveChanges: todolist.updateListWithNewValue,
                                    uid: todolist.todos[index].uid,
                                  ),
                                child: const ToDoItem(),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Color.alphaBlend(todolist.color.withOpacity(0.3),
                            Theme.of(context).primaryColor),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
