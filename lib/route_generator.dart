import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/home_screen_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/view/screens/home_screen.dart';
import 'package:todo_teams/view/screens/list_editing_screen.dart';

import 'controllers/list_editing_screen_controller.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/second':
        if (args is ToDoListController) {
          return MaterialPageRoute(
            builder: (_) => Provider<ListEditingScreenController>(
              create: (_) => ListEditingScreenController(
                passedToDoList: ToDoListController(
                    color: args.color, todos: args.todos, name: args.name),
              ),
              child: ListEditingScreen(),
            ),
          );
        }
        return _errorRoute();
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      // return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
