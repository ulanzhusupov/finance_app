import "package:flutter/material.dart";

class TextFieldControllerFactory {
  final TextEditingController controller;

  TextFieldControllerFactory({this.controller});

  TextEditingController getController() {
    return controller;
  }
}