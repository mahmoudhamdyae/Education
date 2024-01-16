class Lesson {
  int id;
  String title;
  String link;
  String pdf;
  String type;

  Lesson(this.id, this.title, this.link, this.pdf, this.type);

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      json['id'] as int? ?? 0,
      json['name'] as String? ?? '',
      json['link'] as String? ?? '',
      json['pdf'] as String? ?? '',
      json['type'] as String? ?? '',
    );
  }
}