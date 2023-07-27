import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/common/ui_util.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          // 随机字符串生成
          UiUtil.lineTitle('数据保存'),
          Column(
            children: [
              UiUtil.linkBtn("https://pub-web.flutter-io.cn/packages/shared_preferences"),
          ],),
          UiUtil.lineTitle('动画'),
          Column(
            children: [
              UiUtil.linkBtn("https://pub-web.flutter-io.cn/packages/lottie"),
              UiUtil.linkBtn("https://pub-web.flutter-io.cn/packages/animations"),
              UiUtil.linkBtn("https://pub-web.flutter-io.cn/packages/flutter_animate"),
              UiUtil.linkBtn("https://pub-web.flutter-io.cn/packages/animated_text_kit"),
            ],),
          UiUtil.lineTitle('URL'),
          Column(
            children: [
              UiUtil.linkBtn("https://pub-web.flutter-io.cn/packages/url_launcher"),
            ],),
        ],),
      ),
    );
  }
}
