import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get id from vimeo video url test', () {
    final widget = LessonScreen(
        wehdat: const [],
        lesson: Lesson('title', 'https://player.vimeo.com/video/861849145?h=ecfcceb429', 'sample PDF.pdf'),
    );
    expect(widget.extractVideoId('https://player.vimeo.com/video/861849145?h=ecfcceb429'), '861849145');
  });
}