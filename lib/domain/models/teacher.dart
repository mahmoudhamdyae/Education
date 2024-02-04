class TeacherResponse {
  List<Teacher>? teacher;

  TeacherResponse({this.teacher});

  TeacherResponse.fromJson(Map<String, dynamic> json) {
    if (json['teacher'] != null) {
      teacher = <Teacher>[];
      json['teacher'].forEach((v) {
        teacher!.add(new Teacher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? name;
  int? teacherRatioCourse;
  String? teacherDescription;

  Teacher(
      {this.id, this.name, this.teacherRatioCourse, this.teacherDescription});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    teacherRatioCourse = json['Teacher_ratio_course'];
    teacherDescription = json['teacher_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Teacher_ratio_course'] = this.teacherRatioCourse;
    data['teacher_description'] = this.teacherDescription;
    return data;
  }
}