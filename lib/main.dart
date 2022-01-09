import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// videoLesson: https://www.youtube.com/watch?v=WCF4bziDxZA&list=PLzaGtnxLcM7HYt-MhMZ-j0Bmeo4RqPHoS&index=9
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class Car {
  final String name;
  final String model;
  final Color color;

  Car({
    required this.name,
    required this.model,
    this.color = Colors.grey,
  });
}

final carProvider = StateProvider<Car>((ref) {
  return Car(
    name: 'BMW',
    model: 'QTb',
    // color is defualt
  );
});

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // use only Color, so i select color of the car
    Color carColor = ref.watch(carProvider.select((car) => car.color));

    ref.listen(carProvider.select((car) => car.model),
        (oldValueModel, newValueModel) {
      print('oldValueModel: $oldValueModel');
      print('newValueModel: $newValueModel \n');
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            color: carColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Some Text'),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // carProvider.state
                final carProviderController = ref.read(carProvider.notifier);
                // with carProviderController i can access to the state and modify
                carProviderController.state = Car(
                  name: carProviderController.state.name, // oldState
                  // change model and .listen can work!
                  model: carProviderController.state.model + '1',
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
