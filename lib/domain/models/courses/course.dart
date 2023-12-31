class Course {
  int id;
  String name;
  int month;
  int term;
  String marhala;

  Course(this.id, this.name, this.month, this.term, this.marhala);

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['id'] as int? ?? 0,
      json['subject_name'] as String? ?? '',
      json['monthly_subscription_price'] as int? ?? 0,
      json['term_price'] as int? ?? 0,
      json['classroom'] as String? ?? '',
    );
  }
}