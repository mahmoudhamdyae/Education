import 'package:hive/hive.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
class Course extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int month;
  @HiveField(3)
  int term;
  @HiveField(4)
  String marhala;
  @HiveField(5)
  String type;
  @HiveField(6)
  String rate;
  @HiveField(7)
  String teacher;

  Course(this.id, this.name, this.month, this.term, this.marhala, this.type, this.rate, this.teacher);

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['id'] as int? ?? 0,
      json['subject_name'] as String? ?? '',
      json['monthly_subscription_price'] as int? ?? 0,
      json['term_price'] as int? ?? 0,
      json['classroom'] as String? ?? '',
      json['type'] as String? ?? '',
      '4.3',
      'أحمد السعدنى'
    );
  }
}