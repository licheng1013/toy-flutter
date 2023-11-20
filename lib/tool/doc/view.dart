import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'logic.dart';

class DocPage extends StatelessWidget {
  DocPage({Key? key}) : super(key: key);

  final logic = Get.put(DocLogic());
  final state = Get
      .find<DocLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            // 顶部websocket输入框
            TextField(
              controller: state.textController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'websocket地址',
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 刷新按钮
                      Tooltip(
                        message: "刷新文档",
                        child: IconButton(
                          onPressed: () {
                            logic.refreshDoc();
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ),
                      Obx(() {
                        return Tooltip(
                          message: state.connect.value ? "断开连接" : "开启连接",
                          child: IconButton(
                            onPressed: () {
                              if (state.connect.value) {
                                logic.closeWebsocket();
                              } else {
                                logic.connectWebsocket(state.textController.text);
                              }
                            },
                            icon: state.connect.value
                                ? const Icon(Icons.clear_outlined)
                                : const Icon(Icons.connected_tv_outlined),
                          ),
                        );
                      }),
                    ],
                  )),
            ),
            Expanded(
              child: markdownDoc(),
            ),
          ],
        ));
  }

  Widget markdownDoc() {
    return Obx(() {
      return Row(
        children: [
          Expanded(child: TocWidget(controller: logic.tocController)),
          Expanded(
              flex: 3,
              child: MarkdownWidget(
                data: logic.text.value,
                tocController: logic.tocController,
              ))
        ],
      );
    });
  }
}
