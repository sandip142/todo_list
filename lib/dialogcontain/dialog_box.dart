import 'package:flutter/material.dart';
import 'package:todo_list/dialogcontain/Button_deco.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.saveas,
    required this.cancel,
  });
  final controller;
  final VoidCallback saveas;
  final VoidCallback cancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 200,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             TextField(
              controller:controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.black,
                  hintText: "Add new to do"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDeco(
                  name: "save",
                  onpressed: saveas,
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonDeco(
                  name: "cancel",
                  onpressed: cancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
