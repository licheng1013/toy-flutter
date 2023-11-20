import 'package:get/get.dart';
import 'package:toy/common/data.dart';
import 'package:toy/common/theme_ui.dart';

import 'state.dart';

class ToolLogic extends GetxController {
  final ToolState state = ToolState();

  var themeType = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    DataMg dataMg = await DataMg.get();
    themeType.value = dataMg.themeType;
  }

  void changeTheme() async {
    themeType.value = themeType.value == 1 ? 2 : 1;
    DataMg dataMg = await DataMg.get();
    dataMg.themeType = themeType.value;
    dataMg.save();
    ThemeUi.initTheme();
  }
}
