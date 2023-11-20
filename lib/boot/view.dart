import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:get/get.dart';
import 'package:toy/tool/view.dart';

import 'logic.dart';

class BootPage extends StatelessWidget {
  BootPage({Key? key}) : super(key: key);

  final logic = Get.put(BootLogic());
  final state = Get.find<BootLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder.custom(
      defaultBuilder: (BuildContext context, Screen screen) {
        return ToolPage();
      },
    );
  }

}
