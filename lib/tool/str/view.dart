import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toy/common/ui_util.dart';

import 'logic.dart';

class StrPage extends StatelessWidget {
  StrPage({Key? key}) : super(key: key);

  final logic = Get.put(StrLogic());
  final state = Get
      .find<StrLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // 随机字符串生成
              UiUtil.lineTitle('随机字符串生成'),
              Row(
                children: [
                  FilledButton(
                    onPressed: () {
                      state.randomStr();
                    },
                    child: const Text('随机生成'),
                  ),
                  UiUtil.width,
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: state.randomStrController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: UiUtil.inputDecoration("请输入字符串长度"),
                    ),
                  ),
                  UiUtil.width,
                  // 显示随机字符串
                  Expanded(
                    child: TextField(
                      controller: state.strController,
                      decoration: UiUtil.inputDecoration("随机字符串"),
                    ),
                  ),
                ],
              ),
              UiUtil.lineTitle('字符串转换大小写'),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 转换大小写
                    FilledButton(
                      onPressed: () {
                        state.str1Controller.text =
                            state.str1Controller.text.toUpperCase();
                      },
                      child: const Text('大写'),
                    ),
                    UiUtil.width,
                    FilledButton(
                      onPressed: () {
                        state.str1Controller.text =
                            state.str1Controller.text.toLowerCase();
                      },
                      child: const Text('小写'),
                    ),
                    UiUtil.width,
                    Expanded(
                      child: TextField(
                        controller: state.str1Controller,
                        decoration: UiUtil.inputDecoration(
                          "请输入字符串",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UiUtil.lineTitle('26位大小写字母'),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: TextEditingController(
                            text: state.random26UpperLower),
                        // 禁止输入但允许复制
                        decoration: UiUtil.inputDecoration(
                          "26大小写字母",
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              UiUtil.lineTitle('字符串长度统计'),
              Row(
                children: [
                  SizedBox(
                    width: 135,
                    child: FilledButton(
                      onPressed: () {},
                      child: Obx(() {
                        return Text('统计: ${state.strLen.value}');
                      }),
                    ),
                  ),
                  UiUtil.width,
                  Expanded(
                    child: TextField(
                      controller: state.strLenController,
                      // 显示字符串长度
                      decoration: InputDecoration(
                        hintText: "请输入字符串",
                        // 设置边框
                        border: UiUtil.border(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

}
