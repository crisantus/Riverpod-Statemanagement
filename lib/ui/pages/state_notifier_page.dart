import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagment/ui/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier());

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  void onSubmitted(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

   void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    // final userSelect = ref.watch(userProvider.select((value) => value.name));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('StateNotifier Provider'),
          actions: const [],
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) => onSubmitted(ref, value),
              ),
                TextField(
                onSubmitted: (value) => onSubmit(ref, value),
              ),
              Center(
                child: Text(user.name),
              ),
              Center(
                child: Text(user.age.toString()),
              )
            ],
          ),
        ));
  }
}
