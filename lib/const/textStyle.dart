import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

text(String content, double sizeText, Color color,
    [FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
    int? maxline = 1,
    TextDecoration? textDecoration = TextDecoration.none,
    TextAlign? textAlign = TextAlign.center]) {
  return AutoSizeText(
    content,
    style: GoogleFonts.notoSans(
      textStyle: TextStyle(
        fontSize: sizeText,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        overflow: TextOverflow.ellipsis,
        decoration: textDecoration,
      ),
    ),
    minFontSize: 13,
    maxLines: maxline,
    textAlign: textAlign,
  );
}
