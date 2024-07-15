import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomBarVisibilityProvider = StateProvider<bool>((ref) => true);

final currentRouteProvider = StateProvider<String>((ref) => '/');
