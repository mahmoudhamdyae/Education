class Lesson {
  String title;
  String link;
  String pdf;
  String type;

  Lesson(this.title, this.link, this.pdf, this.type);

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      json['name'] as String? ?? '',
      json['link'] as String? ?? '',
      json['pdf'] as String? ?? '',
      json['type'] as String? ?? '',
    );
  }
}