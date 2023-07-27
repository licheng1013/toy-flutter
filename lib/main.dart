import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy/tool/view.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;

  if (!kIsWeb) {
    print("执行了吗");
    WidgetsFlutterBinding.ensureInitialized();
    // 必须加上这一行。
    await windowManager.ensureInitialized();
    const size = Size(1100, 700);
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
  // 禁止从谷歌加载字体

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: GetPlatform.isWeb ? null : 'NotoSansSC',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: ToolPage(),
  ));
}
