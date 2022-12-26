import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 50);
final nameProvider = Provider<String>((ref) => "Santus");

class ProviderPage extends ConsumerWidget {
  const ProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String name = ref.watch(nameProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Provider'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The value is ${ref.watch(valueProvider)}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'My Name is $name',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        )
        // Consumer(
        //   builder: (BuildContext context, WidgetRef ref, Widget? child) {
        //     return Center(
        //       child: Text(
        //         'The value is ${ref.watch(valueProvider)}',
        //         style: Theme.of(context).textTheme.headline4,
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
