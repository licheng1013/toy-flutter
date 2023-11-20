import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final logic = Get.put(AboutLogic());
  final state = Get.find<AboutLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('一个小工具', style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
