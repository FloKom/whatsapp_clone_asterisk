import 'package:flutter/material.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/camera_page.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/settings_page.dart';

final String exploreSettingMenu = '/setting';
final String exemple = '/exemple';

Map<String, WidgetBuilder> AppRoutes() {
  return <String, WidgetBuilder>{
    //route pour atteindre la setting page ( /setting )
    exploreSettingMenu: ((context) => SettingsPage()),

    //exemple url /exemple  pour atteindre la page camera
    exemple: (context) => CameraPage(),
  };
}
