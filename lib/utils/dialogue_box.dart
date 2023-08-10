import 'package:flutter/material.dart';
import 'package:todo_list/utils/my_button.dart';
import 'my_button.dart';

class dialogue_box extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;



  dialogue_box({super.key,required this.controller,required this.onsave,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.85),
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Add your new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                my_button(
                  text: 'Save',
                  onpressed: onsave,
                ),
                const SizedBox(
                  width: 10,
                  height: 90,
                ),
                my_button(
                  text: 'Cancel',
                  onpressed: oncancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
