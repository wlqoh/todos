import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/database/database.dart';

import 'package:todo/widgets/alert_dialog.dart';

part 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  final ToDoDataBase _db;

  ToDoCubit(this._db)
      : super(ToDoState(
      status: ToDoStatus.initial,
      todoList: _db.loadData(),
      controller: TextEditingController()));


  void checkBoxChanged(int index) {
    _db.todos[index][1] = !_db.todos[index][1];
    _db.updateDataBase();
    emit(state.copyWith(todoList: _db.todos));
  }

  void deleteTask(int index) {
    _db.todos.removeAt(index);
    _db.updateDataBase();
    emit(state.copyWith(todoList: _db.todos));
  }

  createNewTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const CreateNewTask();
        }
    );
  }

  renameTask(BuildContext context, index) {
    showDialog(
        context: context,
        builder: (context) {
          return RenameTask(index: index);
        }
    );
  }


  confirmRename(int index) {
    if(state.controller.text != ''){
      _db.todos[index][0] = state.controller.text;
      _db.updateDataBase();
      emit(state.copyWith(todoList: _db.todos));
    }
  }

  saveNewTask() {
    if(state.controller.text != ''){
      _db.todos.add([state.controller.text, false]);
      _db.updateDataBase();
      emit(state.copyWith(todoList: _db.todos));
    }
  }


}