// import 'package:ffi/ffi.dart';
// import 'package:win32/win32.dart';
//
// // void main() {
// //   WinUtil.getPoint((x,y){
// //     print('Current mouse position: $x, $y');
// //   });
// // }
//
// class WinUtil {
//   static Future<void> getPoint(Function(int x, int y) f) async {
//     // 获取当前鼠标位置
//     final point = calloc<POINT>();
//     // 定时获取鼠标位置
//     Timer.periodic(const Duration(milliseconds: 200), (timer) {
//       GetCursorPos(point);
//       f(point.ref.x, point.ref.y);
//     });
//   }
// }
