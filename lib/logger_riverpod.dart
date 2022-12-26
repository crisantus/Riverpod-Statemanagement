import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    debugPrint("$container, $previousValue, $newValue, $previousValue");
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    debugPrint("$provider, $value, $container");
  }

  @override
  void didDispose(ProviderBase provider, ProviderContainer container) {
    //super.didDispose(provider, container);
    debugPrint("$provider, $container");
  }
}
