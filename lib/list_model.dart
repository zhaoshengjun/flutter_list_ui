import 'package:flutter/widgets.dart';
import 'task_row.dart';
import 'task.dart';

class ListModel {
  ListModel(this.listKey, items) : this.items = new List.of(items);

  final GlobalKey<AnimatedListState> listKey;
  final List<Task> items;
  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, Task item) {
    items.insert(index, item);
    _animatedList.insertItem(index);
  }

  Task removeAt(int index) {
    final Task removedItem = items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
          index,
          (context, animation) => new TaskRow(
                task: removedItem,
                animation: animation,
              ));
    }

    return removedItem;
  }

  int get length => items.length;
  Task operator [](int index) => items[index];
  int indexOf(Task item) => items.indexOf(item);
}
