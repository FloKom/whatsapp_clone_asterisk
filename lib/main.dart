import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:whatapp_clone_ui/pages/root_app.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/chat_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/chat_detail_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/calls_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/Routing/AppRoutes.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/settings_page.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:whatapp_clone_ui/theme/colors.dart';

import 'src/about.dart';
import 'src/callscreen.dart';
import 'src/dialpad.dart';
import 'src/register.dart';
import 'src/about.dart';

typedef PageContentBuilder = Widget Function(
    [SIPUAHelper? helper, Object? arguments]);

final SIPUAHelper _helper = SIPUAHelper();
Map<String, PageContentBuilder> routes = {
  '/': ([SIPUAHelper? helper, Object? arguments]) => RootApp(helper),
  '/chat': ([SIPUAHelper? helper, Object? arguments]) => ChatPage(helper),
  '/call': ([SIPUAHelper? helper, Object? arguments]) => CallsPage(helper),
  '/chat/detail': ([SIPUAHelper? helper, Object? arguments, String? name, String? img, String? num]) =>
      ChatDetailPage(name:name, img:img, num: num, helper: helper),
  '/about': ([SIPUAHelper? helper, Object? arguments]) => AboutWidget(),
  '/register': ([SIPUAHelper? helper, Object? arguments]) =>
      RegisterWidget(helper),
  '/callscreen': ([SIPUAHelper? helper, Object? arguments]) =>
      CallScreenWidget(helper, arguments as Call?),
};

Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final PageContentBuilder? pageContentBuilder = routes[name!];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute<Widget>(
          builder: (context) =>
              pageContentBuilder(_helper, settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute<Widget>(
          builder: (context) => pageContentBuilder(_helper));
      return route;
    }
  }
  return null;
}

void main() {
  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "whatsapp",
    initialRoute: '/',
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: greyColor,
        elevation: 10,
      )

    ),
    // theme: ThemeData(
    //   primarySwatch: Colors.,
    //   fontFamily: 'Roboto',
    // ),
    routes: AppRoutes(),
    onGenerateRoute: _onGenerateRoute,
  ));
}

