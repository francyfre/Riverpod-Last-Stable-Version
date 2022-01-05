import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(
     const ProviderScope(
      child: MyApp(),
    ),
  );
}
 // Provider have no state! is much simpler
final myProvider = Provider((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final int someNumber = 22;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("some number $someNumber"),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                print('yo!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
