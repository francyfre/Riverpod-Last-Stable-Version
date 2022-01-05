import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../my_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Provider have no state! is much simpler
final myProvider = Provider((ref) => 3);
final mySecondProvider = Provider((ref) => "Hey, i am Provider");


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  final int someNumber = 22;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myNumber = ref.watch(myProvider);
    String myString = ref.watch(mySecondProvider);
    int mySecondNumber = ref.watch(myThirdProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("some blaBla: $mySecondNumber"),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
