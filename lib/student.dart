import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 2)
class Student {
  Student(
      {required this.name,
      required this.family,
      required this.grade,
      required this.age});

  @HiveField(0)
  String name;

  @HiveField(1)
  String family;

  @HiveField(2)
  double grade;

  @HiveField(3)
  int age;
}
