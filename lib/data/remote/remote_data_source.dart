import 'package:education/domain/models/courses/course.dart';

import '../../domain/models/courses/baqa.dart';
import '../../domain/models/courses/class_model.dart';

class RemoteDataSource {

  Future<ClassModel> getRecordedCourses(String marhala) {
    return Future(() => ClassModel(
        [
          Course('اللغة الإنجليزية', 10, 22, marhala),
          Course('اللغة العربية', 10, 22, marhala),
          Course('الأحياء', 12, 25, marhala),
          Course('الكيمياء', 12, 25, marhala),
          Course('التاريخ', 8, 20, marhala),
          Course('الرياضيات', 12, 25, marhala),
          Course('الفيزياء', 12, 25, marhala),
        ],
        [
          Baqa(8, 7, 60),
          Baqa(7, 0, 38),
        ]
    ));
  }

  Future<List<Course>> getSubscriptions() {
    return Future(() => []);
  }
}