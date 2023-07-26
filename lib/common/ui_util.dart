import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiUtil {
  // 全局宽间隔
  static var width = const SizedBox(
    width: 16,
  );

  // 线条显示标题工具
  static Widget lineTitle(String title,{Color color = Colors.grey}) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Text(
            title,
          ),
          const SizedBox(width: 8,),
          // 线条
          Expanded(
            child: Container(
              height: 1,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  static InputBorder border() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  static InputDecoration inputDecoration(String title) {
    return InputDecoration(
      hintText: title,
      // 设置边框
      border: UiUtil.border(),
    );
  }
}
