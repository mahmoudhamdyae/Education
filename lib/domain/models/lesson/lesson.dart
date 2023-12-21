class Lesson {
  String title;
  String link;
  String pdf;

  Lesson(this.title, this.link, this.pdf);

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      json['name'] as String? ?? '',
      json['link'] as String? ?? '',
      json['pdf'] as String? ?? '',
    );
  }
}