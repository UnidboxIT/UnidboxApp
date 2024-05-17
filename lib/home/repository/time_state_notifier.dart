import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeStateNotifierProvider =
    StateNotifierProvider<TimeStateNotifier, String>(
        (ref) => TimeStateNotifier());

class TimeStateNotifier extends StateNotifier<String> {
  TimeStateNotifier() : super("") {
    calculateTime();
  }

  void calculateTime() {
    DateTime now = DateTime.now();
    DateTime morningStart = DateTime(now.year, now.month, now.day, 5, 0, 0);
    DateTime morningEnd = DateTime(now.year, now.month, now.day, 11, 59, 59);
    DateTime afternoonStart = DateTime(now.year, now.month, now.day, 12, 0, 0);
    DateTime afternoonEnd = DateTime(now.year, now.month, now.day, 20, 59, 59);

    if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
      state = "Good morning,";
    } else if (now.isAfter(afternoonStart) && now.isBefore(afternoonEnd)) {
      state = "Good afternoon,";
    } else {
      state = "";
    }
  }
}
