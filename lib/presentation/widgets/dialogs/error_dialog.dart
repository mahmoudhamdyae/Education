import 'package:flutter/material.dart';

showError(context, String message) {
  return AlertDialog(
    // The shape of the dialog
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    // The title of the dialog
    title: const Text('Oops! Something went wrong.'),
    // The content of the dialog
    content: const Text('Please check your internet connection and try again.'),
    // The actions of the dialog
    actions: [
      // A button to cancel the operation
      TextButton(
        onPressed: () {
          // Close the dialog
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
      // A button to retry the operation
      TextButton(
        onPressed: () {
          // Close the dialog
          Navigator.of(context).pop();
          // Retry the operation
          // _fetchData(context);
        },
        child: const Text('Retry'),
      ),
    ],
  );
}