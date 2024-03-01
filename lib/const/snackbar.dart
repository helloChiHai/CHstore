import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: text(
        message,
        text_size_content,
        Colors.white,
        null,
        null,
        null,
        null,
        null,
        TextAlign.left,
      ),
    ),
  );
}
