import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/common/lottie.dart';

import 'logic.dart';

class BallPage extends StatelessWidget {
  BallPage({Key? key}) : super(key: key);

  final logic = Get.put(BallLogic());
  final state = Get.find<BallLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: logic.onPanUpdate,
      child: Stack(
        children: [
          Obx(() {
            return Positioned(
                left: state.x.value,
                top: state.y.value,
                child: IconButton(
                    icon:  Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: logic.rightAndBottom,
                    ),
                    onPressed: logic.startAnimation));
          }),
          Obx(() {
            return Positioned(
                left: logic.posX.value,
                top: logic.posY.value,
                child: Visibility(
                  visible: logic.isShow.value,
                  child: const Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 30,
                  ),
                ));
          }),
        ],
      ),
    );
  }
}
