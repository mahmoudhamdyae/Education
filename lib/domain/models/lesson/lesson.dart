import 'package:hive/hive.dart';

part 'lesson.g.dart';

@HiveType(typeId: 1)
class Lesson extends HiveObject {
  @HiveField(20)
  int id;
  @HiveField(21)
  String title;
  @HiveField(22)
  String link;
  @HiveField(23)
  String pdf;
  @HiveField(24)
  String type;
  @HiveField(25)
  int tutorialId;

  Lesson(this.id, this.title, this.link, this.pdf, this.type, this.tutorialId);

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      json['id'] as int? ?? 0,
      json['name'] as String? ?? '',
      json['link'] as String? ?? '',
      json['pdf'] as String? ?? '',
      json['type'] as String? ?? '',
      json['tutorial_id'] as int? ?? -1,
    );
  }
}