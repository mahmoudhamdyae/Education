import 'package:flutter/material.dart';

import '../../../../domain/models/comment.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(comment.comment ?? ''),
    );
  }
}
