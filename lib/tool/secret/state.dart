
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';

class SecretState {
  var md5LaterText = TextEditingController();
  var md5Text = TextEditingController();

  var urlText = TextEditingController();
  var urlLaterText = TextEditingController();

  SecretState() {
    md5Text.addListener(() {
      // 如果为空
      if (md5Text.text.isEmpty) {
        md5LaterText.text = '';
        return;
      }
      md5LaterText.text = md5.convert(utf8.encode(md5Text.text)).toString();
    });
  }
}
