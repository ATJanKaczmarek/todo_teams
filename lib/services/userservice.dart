
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_teams/models/todolist_model.dart';
import 'package:todo_teams/models/user_model.dart';

class UserService {
  FirebaseFirestore? _instance;

  User _user = User(name: '', todolists: []);

  User getUser() {
    return _user;
  }

  // void setUserList(ToDoList list) {
  //   int idx = _user.todolists.indexWhere((element) => element.name == list.name);
  //   _user.todolists[idx] = list;
  // }

  List<ToDoList> _todolists = <ToDoList>[];

  List<ToDoList> getToDoLists() {
    return _user.todolists;
  }

  Future<void> getUserFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference users = _instance!.collection('users');
    DocumentSnapshot snapshot = await users.doc('rLLP26SmiZYMoQh9Pvhh').get();
    var data = snapshot.data() as Map;
    var userNameData = data['name'] as String;
    var userListData = data['lists'] as List<dynamic>;

    _user.name = userNameData;

    _user.todolists = User.fromJsonArray(userListData);
  }

  Future<void> updateUserList(ToDoList updatedList) async {
    print(updatedList.items[0].text);
    _instance = FirebaseFirestore.instance;
    CollectionReference users = _instance!.collection('users');

    int idx = _user.todolists
        .indexWhere((element) => element.name == updatedList.name);

    List<Map<dynamic, dynamic>> mappedItems = <Map<dynamic, dynamic>>[];
    for (var i = 0; i < updatedList.items.length; i++) {
      mappedItems.add({
        'isCompleted': updatedList.items[i].isCompleted,
        'text': updatedList.items[i].text,
      });
    }

    await users.doc('rLLP26SmiZYMoQh9Pvhh').update({
      'lists': [
        {
          'color': "${updatedList.color}",
          'name': "${updatedList.name}",
          'items': mappedItems
        }
      ]
    });
    return;
  }
}
