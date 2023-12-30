import 'package:flutter/cupertino.dart';

import '../constants.dart';

List<TextSpan> highlightSearchQuery(String text, String searchQuery) {
  List<TextSpan> textSpans = [];

  List<String> parts = text.toLowerCase().split(searchQuery.toLowerCase());

  for (int i = 0; i < parts.length; i++) {
    String part = parts[i];
    if (part.isNotEmpty) {
      textSpans.add(
        TextSpan(
          text: part,
        ),
      );
    }

    if (i < parts.length - 1) {
      textSpans.add(
        TextSpan(
          text: searchQuery,
          style: TextStyle(
            color: KSecondryColor, // Change color to desired color
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  return textSpans;
}
