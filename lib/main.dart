import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// videoLesson: https://www.youtube.com/watch?v=Eg3ZIT-_rcc&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=8
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
final myProvider =
    StateNotifierProvider<myNotifier, List>((ref) => myNotifier());

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  Random random = Random();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfString = ref.watch(myProvider);

    // is asyncronous, never call in state lifecycle, or onPress{}
    ref.listen<List>(myProvider, (List? prevState, List newState) {
      // callback function, call avery time state changes!
      print('listen: $newState');
    });

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
