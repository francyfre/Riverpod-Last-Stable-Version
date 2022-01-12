import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_stable_aspiiire/page1.dart';
import 'package:riverpod_stable_aspiiire/page2.dart';

// videoLesson: https://www.youtube.com/watch?v=qpfHSWziumM&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=11
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
      },
      initialRoute: '/page1',
    );
  }
}
