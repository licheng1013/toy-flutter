# 弹球效果
## 这只是一个弹球效果
- 如果打开

## 代码
- 如何配置运行，然后最大化窗口即可看到。
```dart
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
```