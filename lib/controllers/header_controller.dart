import 'package:mobx/mobx.dart';
import 'package:todo_teams/services/userservice.dart';

part 'header_controller.g.dart';

enum HeaderType { home, calendar, teamwork }

// const username = "Jan";

class HeaderController = _HeaderController with _$HeaderController;

abstract class _HeaderController with Store {
  @observable
  HeaderType currentType = HeaderType.home;

  @computed
  String get headerText {
    switch (currentType) {
      case HeaderType.teamwork:
        return "Teamwork!";
      case HeaderType.calendar:
        return "Done for today!";
      default:
        return "Hey, ";
    }
  }

  @computed
  String get subHeaderText {
    switch (currentType) {
      case HeaderType.teamwork:
        return "in 2 teams";
      case HeaderType.calendar:
        return "tasks.";
      default:
        return "There are";
    }
  }

  @computed
  String get highlightedText {
    switch (currentType) {
      case HeaderType.teamwork:
        return "5 changes";
      case HeaderType.calendar:
        return "No scheduled";
      default:
        return "3 new tasks";
    }
  }

  @action
  Future<String> getUsername() async {
    UserService service = UserService();
    await service.getUserFromFirebase();
    
    String? username = service.getUser().name;
    
    return username;
  }
}
