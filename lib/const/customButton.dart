import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

customButton(String content, Color backgroundColor, Color textColor,
    double width, double vertical, double horizontal,
    [double borderRadius = 20, Color colorBorder = Colors.transparent]) {
  return Container(
    width: width,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: colorBorder,
        width: 1,
      ),
    ),
    child: text(content, text_size_header, textColor, FontWeight.bold),
  );
}
