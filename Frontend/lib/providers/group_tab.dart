import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'group_tab.g.dart';

@riverpod
class GroupTabIndex extends _$GroupTabIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
