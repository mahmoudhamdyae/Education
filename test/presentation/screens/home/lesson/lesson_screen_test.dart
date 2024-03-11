import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get id from vimeo video url test', () {
    const widget = LessonScreen();
    expect(widget.extractVideoId('https://player.vimeo.com/video/861849145?h=ecfcceb429'), '861849145');
  });
}