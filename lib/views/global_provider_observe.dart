import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalProviderObserver globalProviderObserver = GlobalProviderObserver();

class GlobalProviderObserver extends ProviderObserver {
  ProviderContainer? container;

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    this.container = container;
    // Add custom logic here if needed
  }
}
