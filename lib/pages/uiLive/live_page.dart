import 'package:flutter/material.dart';
import 'package:whatapp_clone_ui/theme/colors.dart';

class LivePage extends StatefulWidget {
  LivePage({Key key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          " _Live page",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
      ),
    );
  }
}
