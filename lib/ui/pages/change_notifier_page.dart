import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagment/ui/models/user.dart';

final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  void onSubmitted(WidgetRef ref, String value) {
    ref.read(userChangeNotifierProvider).updateName(value);
  }

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userChangeNotifierProvider).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userChangeNotifierProvider).user;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('ChangeNotifier Provider'),
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
