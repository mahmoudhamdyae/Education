class Lesson {
  String title;
  String link;

  Lesson(this.title, this.link);

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      json['name'] as String? ?? '',
      json['link'] as String? ?? '',
    );
  }
}