import 'package:flutter/material.dart';

showLoading() {
  print("LOADING");
  return const AlertDialog(
    // The background color
    backgroundColor: Colors.white,
    // The shape of the dialog
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    // The content of the dialog
    title: Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // The loading indicator
          CircularProgressIndicator(),
          SizedBox(
            height: 15,
          ),
          // Some text
          Text('Loading...')
        ],
      ),
    ),
  );
}