import 'package:state_notifier/state_notifier.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_history_state.dart';

class MyRequestHistoryStateNotifier
    extends StateNotifier<MyRequestHistoryState> {
  MyRequestHistoryStateNotifier()
      : super(const MyRequestHistoryState.initial());
  bool productIdContainsQuery = false;
  searchMyRequestHistoryData(
      String query, List<Map<String, dynamic>> searchMyRequestHistoryList) {
    // if (query.isNotEmpty) {
    //   List<Map<String, dynamic>> searchRequest =
    //       searchMyRequestHistoryList.where((request) {
    //     final nameContainsQuery =
    //         request.name.toLowerCase().contains(query.toLowerCase());
    //     final userIdContainsQuery = request.userId[1]
    //         .toString()
    //         .toLowerCase()
    //         .contains(query.toLowerCase());

    //     for (var data in request.productLineList) {
    //       productIdContainsQuery = data.productIdList[1]
    //           .toString()
    //           .trim()
    //           .toLowerCase()
    //           .contains(query.toLowerCase());
    //       // superPrint(data.productIdList[1]);
    //     }

    //     return nameContainsQuery ||
    //         userIdContainsQuery ||
    //         productIdContainsQuery;
    //   }).toList();

    //  state = MyRequestHistoryState.searchMyRequestHistoryValue(searchRequest);
    // }
  }
}
