import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/testing/testing_provider.dart';

class TestingScreen extends ConsumerWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    superPrint("HERE");
    final currentValue = ref.watch(testingStateNotifierProvider);
    ref.listen(testingProvider, (pre, next) {
      CommonMethods.customizedAlertDialog("HAY", context);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(ref.read(testingStateNotifierProvider)),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Update the provider's value
              ref
                  .read(testingStateNotifierProvider.notifier)
                  .updateValue("Update Value");
            },
            child: const Text("Update Value"),
          ),
          ElevatedButton(
            onPressed: () {
              // Update the provider's value
              ref
                  .read(testingStateNotifierProvider.notifier)
                  .updateValue("HAY");
            },
            child: const Text("Hay"),
          ),
        ],
      ),
    );
  }
}
