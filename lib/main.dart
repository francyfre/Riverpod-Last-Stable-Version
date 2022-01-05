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
final myProvider = Provider((ref) => 3);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final int someNumber = 22;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? _) {
              int myValue = ref.watch(myProvider);
              return Text("some number: $myValue");
            },
          ),
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
