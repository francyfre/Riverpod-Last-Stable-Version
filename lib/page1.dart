import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.next_plan_outlined),
          iconSize: 100,
          onPressed: () {
            Navigator.pushNamed(context, '/page2');
          },
        ),
      ),
    );
  }
}
