import 'package:flutter/material.dart';
import 'package:whatapp_clone_ui/theme/colors.dart';

class CataloguePage extends StatefulWidget {
  @override
  _CataloguePageState createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Text(
          "_Catalogue Page ",
          style: TextStyle(
              fontSize: 23, color: white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
