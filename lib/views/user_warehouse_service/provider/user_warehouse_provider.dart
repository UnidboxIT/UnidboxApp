import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/user_warehouse_service/state/user_warehouse_state.dart';
import 'package:unidbox_app/views/user_warehouse_service/user_warehouse_repository.dart';

import '../state_notifier/user_warehouse_state_notifier.dart';

final userWarehouseProvider = Provider((ref) => UserWarehouseRepository());

final userWarehouseStateNotifierProvider =
    StateNotifierProvider<UserWarehouseStateNotifier, UserWarehouseState>(
        (ref) => UserWarehouseStateNotifier(ref.watch(userWarehouseProvider)));
