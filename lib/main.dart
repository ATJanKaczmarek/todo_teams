import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/header_controller.dart';
import 'package:todo_teams/controllers/home_screen_controller.dart';
import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/route_generator.dart';
import 'package:todo_teams/view/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/list_editing_screen_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      Provider<HeaderController>(create: (_) => HeaderController()),
      Provider<ToDoListController>(
          create: (_) => ToDoListController(
              color: const Color(0xFFAAAAAA),
              todos: ObservableList<ToDoItemController>(),
              name: "")),
      Provider<HomeScreenController>(create: (_) => HomeScreenController()),
    ], child: const App()),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = "todoTeam";
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: const Color(0xFF1C1C1E),
        scaffoldBackgroundColor: const Color(0xFF1C1C1E), // Background color
        fontFamily: 'Poppins',

        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF)),
          headline2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFFFFFFFF)),
          headline3: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF845EC2)),
          headline4: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF)),
          headline5: TextStyle(
              fontSize: 6.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFFFFFFFF)),
          headline6: TextStyle(
              fontSize: 6.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
