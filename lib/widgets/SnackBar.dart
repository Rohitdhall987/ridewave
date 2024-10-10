import 'package:flutter/material.dart';

void showBottomSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
