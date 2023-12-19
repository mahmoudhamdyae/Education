class Lesson {
  String title;

  Lesson(this.title);

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      json['title'] as String? ?? '',
    );
  }
}