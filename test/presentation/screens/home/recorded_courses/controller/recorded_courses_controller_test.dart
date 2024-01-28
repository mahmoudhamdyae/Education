// import 'package:collection/collection.dart';
// import 'package:education/core/get_x_di.dart';
// import 'package:education/domain/models/courses/class_model.dart';
// import 'package:education/domain/models/courses/course.dart';
// import 'package:education/domain/repository/repository.dart';
// import 'package:education/presentation/screens/home/recorded_courses/controller/recorded_courses_controller.dart';
// import 'package:education/presentation/screens/home/recorded_courses/widgets/recorded_courses_screen.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
//
// import '../../../../../data/repository/fake_repository.dart';
//
// void main() {
//   test('''Test the state of the reactive variable "classModel"''', () {
//
//     final ClassModel classModel =
//     ClassModel(
//         [Course(0, 'name', 1, 1, 'المرحلة الابتدائية', 'الصف السادس', '5.0', 'teacher')],
//         []
//     );
//
//     final Repository fakeRepository = FakeRepository();
//     final controller = RecordedCoursesController(fakeRepository);
//     expect(controller.classModel.value.courses, []);
//
//     Get.put(controller);
//     final bool equal = const ListEquality().equals(controller.classModel.value.courses, classModel.courses);
//     expect(equal, true);
//   });
// }