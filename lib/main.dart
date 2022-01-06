import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// videoLesson: https://www.youtube.com/watch?v=eT53Ht4r94k&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=5
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Provider have no state! is much simpler
final myProvider = StateProvider((ref) => 100);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //int myValue = ref.watch(myProvider); // access to the state
    int myValue = ref.watch(myProvider.notifier).state; // access to the state

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("some blaBla: $myValue"),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // change state
                //ref.read(myProvider.notifier).state++;
                ref.read(myProvider.state).state++;
                print(ref.read(myProvider));
              },
            ),
          ],
        ),
      ),
    );
  }
}
