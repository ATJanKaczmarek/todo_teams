import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/home_screen_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/view/widgets/header_widget.dart';
import 'package:todo_teams/view/widgets/todo_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homescreen = Provider.of<HomeScreenController>(context);
    // () {homescreen.getSavedToDoLists();} ();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 37.0),
            child: Header(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: Observer(
              builder: (_) => StreamBuilder(
                stream: Stream.fromFuture(homescreen.getSavedToDoLists()),
                builder: (context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.hasData) {
                    return Observer(
                      builder: (_) => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homescreen.todoLists.length,
                        itemBuilder: (_, index) => Provider<ToDoListController>(
                          create: (_) => ToDoListController(
                              color: homescreen.todoLists[index].color,
                              todos: homescreen.todoLists[index].todos,
                              name: homescreen.todoLists[index].name),
                          child: const ToDoList(),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //     body: Column(
    //       children: [
    //         HeaderWidget(),
    //         ToDoListWidget(),
    //         TextButton.icon(onPressed: () {
    //         }, icon: Icon(Icons.add), label: Text("ToDo"))
    //       ],
    //     )
    //   );
  }
}
