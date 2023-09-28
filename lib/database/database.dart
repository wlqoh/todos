import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todos = [];
  final _myBox = Hive.box('MyBox');

  List<dynamic> loadData() {
    if (_myBox.get("TODOLIST") == null) {
      return [];
    } else {
      todos = _myBox.get('TODOLIST');
      return todos;
    }
  }

  void updateDataBase() {
    _myBox.put('TODOLIST', todos);
  }
}
