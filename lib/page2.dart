import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose reset state of provider when close page
final providerOfGetRandomNumber = StateProvider.autoDispose((ref) {
  final random = Random();
  // retur this random number
  return random.nextInt(100);
});

class Page2 extends ConsumerWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myNumber = ref.watch(providerOfGetRandomNumber);
    return Scaffold(
      body: Center(
        child: Text(
          '$myNumber',
          style: const TextStyle(fontSize: 60.0),
        ),
      ),
    );
  }
}
