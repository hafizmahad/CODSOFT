import 'package:flutter/material.dart';

class my_button extends StatelessWidget {
  final String text;
  VoidCallback onpressed;

   my_button({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed,child: Text(text),
    color: Theme.of(context).primaryColor ,);

  }
}
