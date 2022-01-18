import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// videoLesson: https://www.youtube.com/watch?v=_YmepxERz1g&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=12
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final providerOfNumber = StateProvider((ref) => 0);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myNumber = ref.watch(providerOfNumber);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('$myNumber', style: const TextStyle(fontSize: 60)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //ref.read(providerOfNumber.notifier).state++;
            ref
                .read(providerOfNumber.notifier)
                .update((prevState) => prevState + 1);
          },
          child: const Icon(
            Icons.plus_one_rounded,
          ),
        ),
      ),
    );
  }
}
