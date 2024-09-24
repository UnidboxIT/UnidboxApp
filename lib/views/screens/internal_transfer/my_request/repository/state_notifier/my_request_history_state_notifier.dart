import 'package:state_notifier/state_notifier.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_history_state.dart';

class MyRequestHistoryStateNotifier
    extends StateNotifier<MyRequestHistoryState> {
  MyRequestHistoryStateNotifier()
      : super(const MyRequestHistoryState.initial());
  bool productIdContainsQuery = false;
  bool keyContainsQuery = false;

  searchMyRequestHistoryData(
      String query,
      List<Map<String, dynamic>> searchMyRequestHistoryList,
      List<Map<String, dynamic>> tempSearchMyRequestHistoryList) {
    superPrint(searchMyRequestHistoryList);
    superPrint(tempSearchMyRequestHistoryList);
    if (query.isNotEmpty) {
      List<Map<String, dynamic>> requestHistoryList =
          tempSearchMyRequestHistoryList.where((entry) {
        for (var dateEntry in entry.values) {
          if (dateEntry is Map<String, dynamic>) {
            var productLine = dateEntry['product_line'];
            for (var productLineKey in productLine.keys) {
              keyContainsQuery = productLineKey
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase());
              var productLineEntry = productLine[productLineKey];
              superPrint(productLineEntry);
              if (productLineEntry is Map<String, dynamic>) {
                var products = productLineEntry['products'];
                superPrint(products);
                for (var data in products) {
                  superPrint(data.productIdList);
                  productIdContainsQuery = data.productIdList[4]
                          .toString()
                          .trim()
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      data.productIdList[1]
                          .toString()
                          .trim()
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      data.productIdList[2]
                          .toString()
                          .trim()
                          .toLowerCase()
                          .contains(query.toLowerCase());
                }
              }
            }
          }
        }
        return keyContainsQuery || productIdContainsQuery;
      }).toList();
      state =
          MyRequestHistoryState.searchMyRequestHistoryValue(requestHistoryList);
    } else {
      state = MyRequestHistoryState.searchMyRequestHistoryValue(
          tempSearchMyRequestHistoryList);
    }
  }
}
