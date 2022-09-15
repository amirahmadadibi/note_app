import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 3)
class Task extends HiveObject {
  Task({required this.title, required this.subTitle, this.isDone = false});

  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  bool isDone;
}
