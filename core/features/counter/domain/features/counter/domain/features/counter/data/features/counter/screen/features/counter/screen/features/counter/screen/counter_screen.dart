import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'counter_model.dart';
import 'counter_view_model.dart';

class CounterScreen extends ElementaryWidget<CounterViewModel, CounterModel> {
  const CounterScreen({super.key})
      : super(CounterViewModel.new, CounterModel.create);

  static Widget create(BuildContext context) {
    return const CounterScreen();
  }

  @override
  Widget build(CounterViewModel vm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter MVVM')),
      body: Center(
        child: EntityStateNotifierBuilder<int>(
          listenableEntityState: vm.counterState,
          loadingBuilder: (_, __) => const CircularProgressIndicator(),
          errorBuilder: (_, __, ___) => const Text('Error'),
          builder: (_, data) {
            return Text(
              'Count: ${data.value}',
              style: const TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
