import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/suggestion.dart';
import '../services/api_service.dart';



final suggestionFutureProvider =
    FutureProvider.autoDispose.family<Suggestion, String>((ref, id) async {
  ref.keepAlive();
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion(id);

  /** 
   * ref allow us to talk to different provider
   * there are types of ref 
   * ref.keepAlive() works when we have autodispose
   * ref.onDispose((){})
   * ref.onCancle((){})
   * ref.onResume((){})
   * ref.onAddListner((){})
   * ref.onRemoveListner((){})
   */
  
});

/// WedgetRef used for talking from a widget to a provider
/// ProviderRef from provider to a provider
/// Ref 

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final suggestionRef = ref.watch(suggestionFutureProvider('1'));
    final suggestion = ref.watch(suggestionFutureProvider('1'));

    return suggestion.when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(suggestionFutureProvider('1').future),
          child: ListView(
            children: [
              Center(
                child: Text(
                  data.activity,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      );
    }, error: ((error, stackTrace) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: Center(child: Text(error.toString())),
      );
    }), loading: () {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
