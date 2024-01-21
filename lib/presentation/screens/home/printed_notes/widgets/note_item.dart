import 'package:education/presentation/screens/home/printed_notes/widgets/cart_button.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/download_note_button.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/notes/note.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class NoteItem extends StatelessWidget {

  final Note note;
  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => CourseScreen(subject: course,));
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(
            color: ColorManager.lightGrey,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              ImageAssets.books,
              height: 100,
              width: 225,
            ),
            Text(
              note.name,
              style: getLargeStyle(
                  fontWeight: FontWeight.w500
              ),
            ),
            DownloadNoteButton(pdf: note.pdf,),
            const CartButton(),
          ],
        ),
      ),
    );
  }
}
