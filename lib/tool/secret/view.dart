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
                  flex: 1,
                  child: TextField(
                    controller: state.md5Text,
                    decoration: UiUtil.inputDecoration("请输入字符串"),
                  ),
                ),
                UiUtil.width,
                // 显示随机字符串
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: state.md5LaterText,
                    decoration: UiUtil.inputDecoration("MD5加密后的字符串"),
                  ),
                ),
              ],
            ),
            // 随机字符串生成
            UiUtil.lineTitle('URL解码/编码'),
            Row(
              children: [
                FilledButton(
                  onPressed: () {
                    // URL解码
                    state.urlLaterText.text = Uri.decodeFull(state.urlLaterText.text);
                  },
                  child: const Text('解码'),
                ),
                UiUtil.width,
                FilledButton(
                  onPressed: () {
                    // URL编码
                    state.urlLaterText.text = Uri.encodeFull(state.urlText.text);
                  },
                  child: const Text('编码'),
                ),
                UiUtil.width,
                // 显示随机字符串
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: state.urlText,
                    decoration: UiUtil.inputDecoration("请输入字符串"),
                  ),
                ),
                UiUtil.width,
                // 显示随机字符串
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: state.urlLaterText,
                    decoration: UiUtil.inputDecoration("解码/编码后的字符串"),
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
