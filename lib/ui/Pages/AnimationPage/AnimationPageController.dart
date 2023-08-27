import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AnimationPageController extends ControllerMVC {
  late GlobalKey<FormState> formKey;
  late GlobalKey<ScaffoldState> scaffoldKey;
  bool loading = false;

  AnimationPageController() {
    formKey = GlobalKey<FormState>();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }
}
