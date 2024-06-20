import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../outlet_return_repository.dart';
import '../state/outlet_return_state.dart';
import '../state_notifier/outlet_return_state_notifier.dart';

final outletReturnProvider = Provider((ref) => OutletReturnRepository());

final outletReturnStateNotifier =
    StateNotifierProvider<OutletReturnStateNotifier, OutletReturnState>(
        (ref) => OutletReturnStateNotifier(ref.watch(outletReturnProvider)));
