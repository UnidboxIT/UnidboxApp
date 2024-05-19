import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/home/repository/home_repository.dart';
import 'package:unidbox_app/models/noti.dart';

final homeStateProvider = StateProvider((ref) => HomeStateNotifier());

final homeStateNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, AsyncValue>((ref) {
  return HomeStateNotifier();
});

class HomeStateNotifier extends StateNotifier<AsyncValue> {
  HomeStateNotifier() : super(const AsyncData(null));
  List<Noti> notiList = [];
  Future<List<Noti>> notiReminder() async {
    try {
      state = const AsyncValue.loading();
      http.Response response = await HomeRepository.reminder();
      notiList.clear();
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
