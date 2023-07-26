import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FlutterPage extends StatelessWidget {
  FlutterPage({Key? key}) : super(key: key);

  final logic = Get.put(FlutterLogic());
  final state = Get.find<FlutterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
    );
  }
}
