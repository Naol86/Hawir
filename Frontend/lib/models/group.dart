import 'package:hive_flutter/hive_flutter.dart';

part 'group.g.dart';

@HiveType(typeId: 0)
class Group {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  DateTime startDate;
  @HiveField(3)
  DateTime endDate;
  @HiveField(4)
  List<int> memebers;
  @HiveField(5)
  String description;
  @HiveField(6)
  double prices;
  @HiveField(7)
  List<String> tags;

  Group({
    required this.title,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.memebers,
    required this.description,
    required this.tags,
    required this.prices,
  });
}
