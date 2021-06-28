import 'dart:collection';
import 'package:crypto_wallet_app/model/todo_model.dart';
import 'package:flutter/cupertino.dart';

class TodoNotifier with ChangeNotifier {
  List<Todo> _todoList = [];
  late Todo _currentTodo;

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(_todoList);

  Todo get currentTodo => _currentTodo;

  set todoList(List<Todo> todoList) {
    _todoList = todoList;
    notifyListeners();
  }

  set currentTodo(Todo todo) {
    _currentTodo = todo;
    notifyListeners();
  }

  addTodo(Todo todo) {
    _todoList.insert(0, todo);
    notifyListeners();
  }

  deleteTodo(Todo todo) {
    _todoList.removeWhere((_todo) => _todo.id == todo.id);
    notifyListeners();
  }
}