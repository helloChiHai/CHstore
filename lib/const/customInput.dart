import 'package:chstore/const/textSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

final RegExp passwordLengthRegex = RegExp(r'^.{6,}$');
final RegExp passwordUpperLowerRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{1,}$');

customInput(TextEditingController textEditingController, String label,
    double width, bool showIconVisibility,
    [String? valueEmpty,
    bool? obscureText,
    Function(bool)? toggleObscureText,
    TextInputType? textInputType]) {
  return SizedBox(
    width: width,
    child: TextFormField(
      controller: textEditingController,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: showIconVisibility == false
            ? null
            : IconButton(
                onPressed: () {
                  if (toggleObscureText != null && obscureText != null) {
                    toggleObscureText(obscureText);
                  }
                },
                icon: Icon(
                  obscureText != null && obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
        label: Text(label),
        errorStyle: const TextStyle(fontSize: text_size_content),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return valueEmpty;
        }
        return null;
      },
    ),
  );
}
