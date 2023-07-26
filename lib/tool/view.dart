import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:toy/tool/str/view.dart';

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
                      selectedTileColor: Colors.blue.shade200,
                      onTap: () {
                        state.selectedIndex.value = index;
                      },
                      leading: state.tools[index].icon,
                      title: Text(state.tools[index].title),
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
              flex: 5,
              child: Obx(() {
                return IndexedStack(
                  index: state.selectedIndex.value,
                  children: [
                    for(int i=0;i < state.tools.length;i++)
                    _showAnimation(child: state.tools[i].widget, isShow: i == state.selectedIndex.value)
                  ],
                );
              })
            ),
          ],
        ));
  }

  // 显示动画
   Widget _showAnimation({required Widget child,required bool isShow}) {
      return isShow ? child.animate().fade().moveY(begin: 150,duration: 200.ms) : child;
   }
}
