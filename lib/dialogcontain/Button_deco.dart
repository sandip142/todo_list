import 'package:flutter/material.dart';

class ButtonDeco extends StatelessWidget {
  final String name;
  final VoidCallback onpressed;
   const ButtonDeco({
    super.key,
    required this.name,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      child: Text(name),
    );
  }
}
