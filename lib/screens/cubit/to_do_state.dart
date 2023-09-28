part of 'to_do_cubit.dart';

enum ToDoStatus {
  initial,
  empty,
  notEmpty,
}

class ToDoState {
  final ToDoStatus _status;
  final List<dynamic> _todoList;
  final TextEditingController _controller;

  ToDoState({
    required ToDoStatus status,
    required List<dynamic> todoList,
    required TextEditingController controller,
  })  : _todoList = todoList,
        _status = status,
        _controller = controller;

  ToDoStatus get status => _status;

  List<dynamic> get todoList => _todoList;

  TextEditingController get controller => _controller;

  ToDoState copyWith({
    ToDoStatus? status,
    List<dynamic>? todoList,
    TextEditingController? controller,
  }) {
    return ToDoState(
        status: status ?? _status,
        todoList: todoList ?? _todoList,
        controller: controller ?? _controller);
  }
}