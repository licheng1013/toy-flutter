import 'dart:math';



import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toy/common/data.dart';

import 'state.dart';

class BallLogic extends GetxController  {
  final BallState state = BallState();


  final double leftAndTop = -15;
  // 设置右下边界
  final double rightAndBottom = 75;




  void onPanUpdate(DragUpdateDetails details)  async{
    state.x.value += details.delta.dx;
    state.y.value += details.delta.dy;
    // 不能超出屏幕
    if (state.x.value < leftAndTop) {
      state.x.value = leftAndTop;
    }
    if (state.y.value < leftAndTop) {
      state.y.value = leftAndTop;
    }
    if (state.x.value > Get.width - rightAndBottom) {
      state.x.value = Get.width - rightAndBottom;
    }
    if (state.y.value > Get.height - rightAndBottom) {
      state.y.value = Get.height - rightAndBottom;
    }
    var dataMg = await DataMg.get();
    dataMg.x = state.x.value;
    dataMg.y = state.y.value;
    dataMg.save();
  }

  @override
  void onInit() async {
    super.onInit();
    var dataMg = await DataMg.get();
    // 如果都是0，则设置在右下角
    if(dataMg.x == 0 && dataMg.y == 0) {
      dataMg.y =  Get.width + rightAndBottom ;
      dataMg.x = Get.height + rightAndBottom;
      dataMg.save();
    }
    state.x.value = dataMg.x;
    state.y.value =  dataMg.y;
    print("数据: $dataMg");
  }



  void startAnimation() async {
    if(isShow.value){
      return;
    }

    posX.value = state.x.value + rightAndBottom / 2 - 7.5;
    posY.value = state.y.value + rightAndBottom / 2 - 5;
    isShow.value = true;

    // 随机往一个角度方向进行直线移动知道碰到墙壁
    var angle = Random().nextDouble();
    var speed = 10.0;
    var count = 10;
    while(true){
      await Future.delayed(const Duration(milliseconds: 10));
      posX.value += speed * cos(angle);
      posY.value += speed * sin(angle);
      if(posX.value < 0 || posX.value > Get.width - 15){
        angle = pi - angle;
        count --;
        // 设置特效位置
        // effectX.value = posX.value;
        // effectY.value = posY.value;
        // isEffectShow.value = true;
      }
      if(posY.value < 0 || posY.value > Get.height - 15){
        angle = -angle;
        count --;
        // 设置特效位置
        // effectX.value = posX.value;
        // effectY.value = posY.value;
        // isEffectShow.value = true;
      }
      if(count <= 0){
        break;
      }
    }
    isShow.value = false;

  }

  // 球坐标
  var posX = 0.0.obs;
  var posY = 0.0.obs;
  // 是否显示
  var isShow = false.obs;



// // 特效位置
  // var effectX = 0.0.obs;
  // var effectY = 0.0.obs;
  // // 特效是否显示
  // var isEffectShow = false.obs;
}
