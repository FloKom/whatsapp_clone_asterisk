import 'package:flutter/material.dart';

class StreamingPage extends StatefulWidget {
  StreamingPage({Key key}) : super(key: key);

  @override
  State<StreamingPage> createState() => _StreamingPageState();
}

class _StreamingPageState extends State<StreamingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          " _Streaming page",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
