import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/ball/view.dart';
import 'package:toy/common/win.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 必须加上这一行。
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(200, 200),
    size: Size(200, 200),
    center: true,
    // 显示标题栏
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    title: "",
    titleBarStyle: TitleBarStyle.normal,
    alwaysOnTop: true,
    // 全屏
    fullScreen: true,
  );


  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await  windowManager.setFullScreen(true);
  });

 // windowManager.setIgnoreMouseEvents(true);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // 使用系统默认字体
      fontFamily: 'NotoSansSC',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: BallPage(),
  ));


  //await windowManager.setIgnoreMouseEvents(true);
  WinUtil.getPoint((x, y) async {
    print('Current mouse position: $x, $y');
  });

}


