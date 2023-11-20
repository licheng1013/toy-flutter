import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:toy/common/ui_util.dart';
import 'package:toy/tool/str/view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logic.dart';

class ToolPage extends StatelessWidget {
  ToolPage({Key? key}) : super(key: key);

  final logic = Get.put(ToolLogic());
  final state = Get.find<ToolLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: state.tools.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return ListTile(
                  selected: index == state.selectedIndex.value,
                  onTap: () {
                    state.selectedIndex.value = index;
                  },
                  //leading: state.tools[index].icon,
                  title: Center(child: Text(state.tools[index].title)),
                );
              });
            },
          ),
        ),
        // 间隔线
        Container(
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
            flex: 6,
            child: Column(
              children: [
                Obx(() => Visibility(
                      visible: state.selectedIndex.value != 2,
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          // 从右到左
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // star
                            IconButton(
                              onPressed: () {
                                UiUtil.openUrl(
                                    "https://github.com/licheng1013/toy-flutter");
                              },
                              icon: const Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                            ),

                            // 暗黑/亮白模式
                            Obx(() {
                              return IconButton(
                                onPressed: logic.changeTheme,
                                icon: Icon(
                                  logic.themeType.value == 1
                                      ? Icons.dark_mode
                                      : Icons.light_mode,
                                  color: logic.themeType.value == 1
                                      ? Colors.grey
                                      : Colors.deepOrange,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  child: Obx(() {
                    return IndexedStack(
                      index: state.selectedIndex.value,
                      children: [
                        for (int i = 0; i < state.tools.length; i++)
                          _showAnimation(
                              child: state.tools[i].widget,
                              isShow: i == state.selectedIndex.value)
                      ],
                    );
                  }),
                ),
              ],
            )),
      ],
    ));
  }

  // 显示动画
  Widget _showAnimation({required Widget child, required bool isShow}) {
    return isShow
        ? child.animate().fade().moveY(begin: 150, duration: 200.ms)
        : child;
  }
}
