import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/common/ui_util.dart';

import 'logic.dart';

class SecretPage extends StatelessWidget {
  SecretPage({Key? key}) : super(key: key);

  final logic = Get.put(SecretLogic());
  final state = Get.find<SecretLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('加密解密'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 随机字符串生成
            UiUtil.lineTitle('MD5加密'),
            Row(
              children: [
                // 显示随机字符串
                Expanded(
                  child: TextField(
                    controller: state.md5Text,
                    decoration: UiUtil.inputDecoration("请输入字符串"),
                  ),
                ),
                UiUtil.width,
                // 显示随机字符串
                Expanded(
                  child: TextField(
                    controller: state.md5LaterText,
                    decoration: UiUtil.inputDecoration("MD5加密后的字符串"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
