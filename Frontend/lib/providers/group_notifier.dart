import 'package:hawir/models/group.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_notifier.g.dart';

@riverpod
class GroupNotifier extends _$GroupNotifier {
  @override
  Group build() {
    return Group(
      id: 1,
      title: "Meskel Festival",
      description: "description",
      startDate: DateTime.now(),
      endDate: DateTime(2024, 7, 20),
      memebers: [1],
      prices: 150,
      tags: ["culture", "religious"],
    );
  }

  void updateGroup(Group group) {
    state = group;
  }
}
