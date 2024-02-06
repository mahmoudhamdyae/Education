import 'package:education/presentation/screens/home/printed_notes/widgets/note_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../domain/models/notes/note.dart';
import '../../../../widgets/top_bar.dart';

class NotesScreen extends StatelessWidget {

  final List<Note> notes;
  const NotesScreen({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 160).toInt(),
      childAspectRatio: (1/1.6),
      children: List.generate(notes.length, (index) {
        return NoteItem(note: notes[index]);
      }),
    );
  }
}
