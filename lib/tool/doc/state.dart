import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DocState {
  var textController = TextEditingController(text: "ws://localhost:20020");

  var connect = false.obs;

  DocState() {
    ///Initialize variables
  }
}
