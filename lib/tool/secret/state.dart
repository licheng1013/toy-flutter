
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';

class SecretState {
  var md5LaterText = TextEditingController();
  var md5Text = TextEditingController();

  SecretState() {
    md5Text.addListener(() {
      md5LaterText.text = md5.convert(utf8.encode(md5Text.text)).toString();
    });
  }
}
