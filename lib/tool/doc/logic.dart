import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:toy/tool/doc/doc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'state.dart';

class DocLogic extends GetxController {
  final DocState state = DocState();

  var tocController = TocController();
  var text = "".obs;

  @override
  void onInit() async {
    super.onInit();
    var text = await rootBundle.loadString('assets/lottie/demo.md');
    updateMd(text);
  }

  WebSocketChannel? channel;

  // 更新md
  void updateMd(String text) {
    this.text.value = buildMd(text);
    tocController = TocController();
  }

  void connectWebsocket(String url) {
    if (url == "") {
      BotToast.showText(text: "连接为空"); //弹出一个文本框;
      return;
    }

    final wsUrl = Uri.parse(url);
    channel = WebSocketChannel.connect(wsUrl);
    channel?.stream.listen((message) {
      if (!state.connect.value) {
        BotToast.showText(text: "连接成功");
      }
      state.connect.value = true;
      //print("Web: $message");
      updateMd(message);
    }, onError: (error) {
      BotToast.showText(text: "连接失败");
      state.connect.value = false;
    }, onDone: () {
      BotToast.showText(text: "连接断开");
      state.connect.value = false;
    });
  }

  // 关闭websocket
  void closeWebsocket() {
    channel?.sink.close(status.goingAway);
    state.connect.value = false;
  }

  void refreshDoc() {
    if (state.connect.value) {
      channel?.sink.add("refresh");
    }else{
      BotToast.showText(text: "请先连接websocket");
    }
  }
}
