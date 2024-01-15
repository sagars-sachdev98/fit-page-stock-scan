import 'package:flutter/material.dart';

class PlainTextWidget extends StatelessWidget {
  final String text;

  const PlainTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}
