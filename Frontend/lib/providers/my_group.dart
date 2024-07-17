import 'package:hawir/models/group.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_group.g.dart';

@riverpod
class MyGroup extends _$MyGroup {
  @override
  List<Group> build() {
    try {
      final box = Hive.box<Group>('myGroupsBox');

      return box.values.toList();
    } catch (e) {
      return [];
    }
  }

  void addGroup(Group group) {
    final box = Hive.box<Group>('myGroupsBox');
    box.put(group.id, group);

    state = [...state, group];
  }

  int listLen() {
    return state.length;
  }
}
