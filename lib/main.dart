import 'package:flutter/material.dart';
import 'package:whatapp_clone_ui/pages/root_app.dart';
import 'package:whatapp_clone_ui/pages/uiChat/Routing/AppRoutes.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/settings_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "whatsapp",
    home: RootApp(),
    routes: AppRoutes(),
  ));
}

