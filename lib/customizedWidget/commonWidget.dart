import 'package:flutter/material.dart';
import '../theme/colors.dart';

var dropdownValue = "one";

IconButton settingWigdet(context) {
  return IconButton(
    color: iconColor,
    onPressed: () {
      Navigator.pushNamed(context, "/setting");
    },
    icon: Icon(
      Icons.more_vert,
    ),
  );
}

class SettingMenuChatPage extends StatefulWidget {
  SettingMenuChatPage({Key key}) : super(key: key);

  @override
  State<SettingMenuChatPage> createState() => _SettingMenuChatPageState();
}

class _SettingMenuChatPageState extends State<SettingMenuChatPage> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: 40,
        itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("setting"),
                value: "setting",
              ),
              PopupMenuItem(
                child: const Text("new group"),
                value: "newgroupe",
              ),
              PopupMenuItem(
                child: const Text("diffusion"),
                value: "diffusion",
              ),
            ],
        onSelected: (String value) {
          setState(() {
            Navigator.pushNamed(context, "/$value");
          });
        });
  }
}

class SettingMenuStatusPage extends StatefulWidget {
  SettingMenuStatusPage({Key key}) : super(key: key);

  @override
  State<SettingMenuStatusPage> createState() => _SettingMenuStatusPageState();
}

class _SettingMenuStatusPageState extends State<SettingMenuStatusPage> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: 40,
        itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("setting"),
                value: "setting",
              ),
              PopupMenuItem(
                child: const Text("new group"),
                value: "newgroupe",
              ),
              PopupMenuItem(
                child: const Text("diffusion"),
                value: "diffusion",
              ),
            ],
        onSelected: (String value) {
          setState(() {
            Navigator.pushNamed(context, "/$value");
          });
        });
  }
}

class SettingMenuCallsPage extends StatefulWidget {
  SettingMenuCallsPage({Key key}) : super(key: key);

  @override
  State<SettingMenuCallsPage> createState() => _SettingMenuCallsPageState();
}

class _SettingMenuCallsPageState extends State<SettingMenuCallsPage> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: 40,
        itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("setting"),
                value: "setting",
              ),
              PopupMenuItem(
                child: const Text("new group"),
                value: "newgroupe",
              ),
              PopupMenuItem(
                child: const Text("diffusion"),
                value: "diffusion",
              ),
            ],
        onSelected: (String value) {
          setState(() {
            Navigator.pushNamed(context, "/$value");
          });
        });
  }
}
