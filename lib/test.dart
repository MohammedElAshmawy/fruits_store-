import 'package:flutter/material.dart';

class testScreen extends StatelessWidget {
  const testScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        children: [
          Center(child: Text("Text Screen ")),
        ],
      ),
    );
  }
}