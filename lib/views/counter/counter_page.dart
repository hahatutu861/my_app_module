import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/utils/build_context_extension.dart';

import 'package:my_app_module/viewmodels/counter/counter_viewmodel_provider.dart';
import 'package:my_app_module/viewmodels/counter/counter_state.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.counterPage),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: switch (counterState) {
          CounterStateInitial() || CounterStateLoading() => const CircularProgressIndicator(),
          CounterStateLoaded(:final counter) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.youHavePushedButton,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          CounterStateError(:final message) => Text(
            context.l10n.error(message),
            style: const TextStyle(color: Colors.red),
          ),
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () =>
                ref.read(counterViewModelProvider.notifier).increment(),
            tooltip: context.l10n.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () =>
                ref.read(counterViewModelProvider.notifier).decrement(),
            tooltip: context.l10n.decrement,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () =>
                ref.read(counterViewModelProvider.notifier).reset(),
            tooltip: context.l10n.reset,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
