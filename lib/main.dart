import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// videoLesson: https://www.youtube.com/watch?v=2kP-2t3_taE&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=7
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class myNotifier extends StateNotifier<List<String>> {
  myNotifier() : super([]); // initial value

  void add(String stringToAdd) {
    state = [...state, stringToAdd];
    // state = [oldState, newState];
  }
}

// Provider
final myProvider = StateNotifierProvider((ref) => myNotifier());

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  Random random = Random();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfString = ref.watch(myProvider) as List;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
              children: //listOfString.map((string) => Text(string)).toList(),
                  [
                ...listOfString.map((string) => Text(string)),
              ]),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // change status
                ref
                    .read(myProvider.notifier)
                    .add('new string ${random.nextInt(100)}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
