import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamValueProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Stream Provider'),
        ),
        body: stream.when(data: (data) {
          return Center(child: Text("Streaming $data"));
        }, error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }));
  }
}
