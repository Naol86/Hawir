class Group {
  int id;
  String title;
  DateTime startDate;
  DateTime endDate;
  List<int> memebers;
  String description;
  double prices;
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
