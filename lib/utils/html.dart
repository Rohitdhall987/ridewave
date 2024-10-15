import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

Widget htmlWidget({required String htmlContent}) {
  return Html(
    data: htmlContent,
    // Optional styling or customization
    style: {
      "body": Style(
        fontSize: FontSize.large, // Customize the font size
        color: Colors.black,      // Set the text color
      ),
    },
  );
}
