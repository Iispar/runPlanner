import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FilledButton(onPressed: () {}, child: Text("hello"))
    );
  }
}