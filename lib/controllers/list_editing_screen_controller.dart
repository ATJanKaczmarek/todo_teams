import 'package:mobx/mobx.dart';
import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/models/user_model.dart';
import 'package:todo_teams/services/userservice.dart';
import 'package:todo_teams/view/widgets/todo_item_widget.dart';

part 'list_editing_screen_controller.g.dart';

class ListEditingScreenController = _ListEditingScreenController
    with _$ListEditingScreenController;

abstract class _ListEditingScreenController with Store {
  _ListEditingScreenController({
    required this.passedToDoList,
  });

  @observable
  ToDoListController passedToDoList;



  @action
  void updateListAfterChange(String textNew, String uid) {
    print(passedToDoList);
    print("=========================================================================");

    passedToDoList.replace(uid, textNew);
    passedToDoList.updateListWithNewValue(textNew, uid);
  }
}
