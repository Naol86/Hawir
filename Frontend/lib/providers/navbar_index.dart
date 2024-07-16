import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'navbar_index.g.dart';

@riverpod
class NavbarIndex extends _$NavbarIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
