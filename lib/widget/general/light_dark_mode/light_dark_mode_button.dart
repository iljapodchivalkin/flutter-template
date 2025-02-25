import 'package:flutter/material.dart';

class LightDarkModeButton extends StatelessWidget {
  const LightDarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blueAccent),
      height: 40,
      width: 40,
      child: Row(
        children: [
          Text('Light mode'),
        ],
      ),
    );
  }
}
