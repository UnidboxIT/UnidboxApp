import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/home/repository/home_repository.dart';
import 'package:unidbox_app/models/noti.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

final homeStateProvider = StateProvider((ref) => HomeRepository());

final homeStateNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, AsyncValue>((ref) {
  final homeRepository = ref.watch(homeStateProvider);
  return HomeStateNotifier(homeRepository);
});

class HomeStateNotifier extends StateNotifier<AsyncValue<void>> {
  HomeStateNotifier(this._homeRepository) : super(const AsyncData(null));

  final HomeRepository _homeRepository;

  Future<List<Noti>> notiReminder() async {
    List<Noti> notiList = [];
    try {
      state = const AsyncValue.loading();
      http.Response response = await _homeRepository.reminder();
      Map<String, dynamic> result = jsonDecode(response.body);

      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        notiList.add(Noti.fromJson(element));
      }
    } catch (e) {
      state = AsyncValue.error('Could not place order', StackTrace.current);
    } finally {
      state = const AsyncValue.data(null);
    }
    return notiList;
  }
}
