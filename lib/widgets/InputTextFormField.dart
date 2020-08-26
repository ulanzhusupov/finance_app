import "package:flutter/material.dart";

import '../constants.dart';

class InputTextFormField extends StatelessWidget {
  String fieldName;
  bool isObscure = false;
  Function onChanged;
  TextInputType fieldType;
  InputTextFormField(
      {this.fieldName, this.isObscure, this.onChanged, this.fieldType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      onChanged: onChanged,
      validator: (val) {
        if (val.isEmpty) {
          return "Введите ваш $fieldName!";
        }
        return null;
      },
      keyboardType: fieldType,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
          hintText: fieldName,
          hintStyle: kRegularTextStyle.copyWith(
              fontSize: 16.0, color: Colors.white.withOpacity(0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
