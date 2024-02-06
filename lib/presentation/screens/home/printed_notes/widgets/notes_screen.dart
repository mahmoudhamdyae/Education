import 'package:education/domain/models/package.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/note_item.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/package_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../domain/models/notes/note.dart';

class NotesScreen extends StatelessWidget {

  final List<Note> notes;
  final List<Package> packages;
  const NotesScreen({super.key, required this.notes, required this.packages});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        packages.isEmpty ? Container() : _buildPackages(context),
        notes.isEmpty ? Container() : _buildNotes(context),
      ],
    );
  }

  Widget _buildPackages(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            top: 8.0,
            bottom: 4.0,
          ),
          child: Text(
            AppStrings.packages,
            style: getLargeStyle(),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          children: List.generate(packages.length, (index) {
            return PackageItem(package: packages[index], index: index,);
          }),
        ),
      ],
    );
  }

  Widget _buildNotes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: 16.0,
              left: 16.0,
              top: 8.0,
              bottom: 4.0,
          ),
          child: Text(
            AppStrings.notes,
            style: getLargeStyle(),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 160).toInt(),
          childAspectRatio: (1/1.6),
          children: List.generate(notes.length, (index) {
            return NoteItem(note: notes[index], index: index);
          }),
        ),
      ],
    );
  }
}
