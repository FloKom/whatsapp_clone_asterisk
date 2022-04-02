import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/calls_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/camera_page.dart';
import 'package:whatapp_clone_ui/pages/uiCatalogue/catalogue.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/chat_page.dart';
import 'package:whatapp_clone_ui/pages/uiLive/live_page.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/settings_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/status_page.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/streaming_page.dart';
import 'package:whatapp_clone_ui/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
      bottomNavigationBar: Wrap(
        children: [getFooter()],
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ChatPage(),
        CallsPage(),
        StatusPage(),
        LivePage(),
        StreamingPage(),
        CataloguePage(),
      ],
    );
  }

  Widget getFooter() {
    List iconItems = [
      LineIcons.comment,
      LineIcons.phone,
      LineIcons.circle,
      LineIcons.modx,
      LineIcons.stream,
      LineIcons.quinscape,
    ];
    List textItems = [
      "Chats",
      "Calls",
      "Status",
      "live",
      "streaming",
      "catalogue"
    ];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(textItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      iconItems[index],
                      color:
                          pageIndex == index ? primary : white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(textItems[index],
                        style: TextStyle(
                            fontSize: 10,
                            color: pageIndex == index
                                ? primary
                                : white.withOpacity(0.5).withOpacity(0.5))),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
