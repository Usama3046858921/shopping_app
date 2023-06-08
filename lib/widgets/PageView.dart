import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageVIewWidget extends StatefulWidget {
  const PageVIewWidget({Key? key}) : super(key: key);

  @override
  State<PageVIewWidget> createState() => _PageVIewWidgetState();
}

class _PageVIewWidgetState extends State<PageVIewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
