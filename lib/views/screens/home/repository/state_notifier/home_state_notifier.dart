import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/views/screens/home/repository/home_repository.dart';
import 'package:unidbox_app/views/screens/home/repository/state/home_state.dart';
import '../../domain/my_task.dart';
import '../../domain/noti.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier(
    this._homeRepository,
  ) : super(const HomeState.initial());

  final HomeRepository _homeRepository;

  List<MyTask> myTaskList = [];
  List<MyTask> tempTaskList = [];
  List<MyTask> myTaskHomeMenuList = [];
  Map<int, List<MyTask>> myTaskDetailMap = {};

  Future<void> notiReminder() async {
    try {
      //state = const HomeState.loading();
      http.Response response = await _homeRepository.reminder();
      Map<String, dynamic> result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      List<Noti> notiList = dataList.map((e) => Noti.fromJson(e)).toList();
      state = HomeState.loadNoti(notiList);
    } catch (e) {
      state = HomeState.error(error: e.toString());
    }
  }

  Future<void> getAllMyTask() async {
    try {
      state = const HomeState.loading();
      http.Response response = await _homeRepository.myTask();
      Map<String, dynamic> result = jsonDecode(response.body);
      myTaskList.clear();
      myTaskHomeMenuList.clear();
      myTaskDetailMap.clear();
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          myTaskHomeMenuList.add(MyTask.fromJson(element));
        }
        for (var myTask in myTaskHomeMenuList) {
          if (myTask.parentID.isEmpty) {
            myTaskList.add(myTask);
          } else {
            if (myTaskDetailMap.containsKey(myTask.parentID[0])) {
              myTaskDetailMap[myTask.parentID[0]]?.add(myTask);
            } else {
              myTaskDetailMap[myTask.parentID[0]] = [myTask];
            }
          }
        }
      }

      state = HomeState.loadMyTask(myTaskList);
      state = HomeState.loadMyTaskDetail(myTaskDetailMap);
    } catch (e) {
      state = HomeState.error(error: e.toString());
    }
  }
}
