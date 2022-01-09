import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// videoLesson: https://www.youtube.com/watch?v=sW59bZhE7Us&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=10
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

enum TypeOfNumber {
  low,
  medium,
  high,
}

final familyOfGetRandomNumber = StateProvider.family((ref, TypeOfNumber type) {
  final random = Random();
  late int _generateNumber;

  //TypeOfNumber type = TypeOfNumber.low; // notHere

  if (type == TypeOfNumber.low) {
    _generateNumber = random.nextInt(10);
  }
  if (type == TypeOfNumber.medium) {
    _generateNumber = random.nextInt(40);
  }
  if (type == TypeOfNumber.high) {
    _generateNumber = random.nextInt(50);
  }

  return _generateNumber;
});

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // need to send type to provider
    int myNumber = ref.watch(familyOfGetRandomNumber(TypeOfNumber.high));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('$myNumber'),
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
