import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/ball/view.dart';
import 'package:toy/tool/view.dart';
import 'package:window_manager/window_manager.dart';

void main() async {

  if( GetPlatform.isDesktop){
    WidgetsFlutterBinding.ensureInitialized();
    // 必须加上这一行。
    await windowManager.ensureInitialized();
    const size = Size(1100, 800);
    WindowOptions windowOptions = const WindowOptions(
      minimumSize: size,
      size: size,
      center: true,
      // 显示标题栏
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "小工具",
      titleBarStyle: TitleBarStyle.normal,
      // 全屏
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }


  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'NotoSansSC',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: ToolPage(),
  ));


}


