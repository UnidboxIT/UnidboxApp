import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/home/repository/home_repository.dart';
import 'package:unidbox_app/models/login/admin.dart';
import 'package:unidbox_app/models/noti.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

final homeStateProvider = StateProvider((ref) => HomeRepository());

final homeStateNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(ref.watch(homeStateProvider));
});

class HomeState {
  final List<Noti> notiList;
  final List<Admin> userList;
  final bool isLoading;

  HomeState({
    required this.notiList,
    required this.userList,
    required this.isLoading,
  });

  HomeState.initial()
      : notiList = [],
        userList = [],
        isLoading = false;

  HomeState copyWith({
    List<Noti>? notiList,
    List<Admin>? userList,
    bool? isLoading,
  }) {
    return HomeState(
      notiList: notiList ?? this.notiList,
      userList: userList ?? this.userList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier(this._homeRepository) : super(HomeState.initial()) {
    notiReminder();
  }
  final HomeRepository _homeRepository;

  Future<List<Noti>> notiReminder() async {
    List<Noti> notiList = [];
    try {
      state = state.copyWith(isLoading: true);
      http.Response response = await _homeRepository.reminder();
      Map<String, dynamic> result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      notiList = dataList.map((e) => Noti.fromJson(e)).toList();
      state = state.copyWith(notiList: notiList, isLoading: false);
      superPrint(state.notiList);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
    return state.notiList;
  }
}
