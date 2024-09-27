import 'package:state_notifier/state_notifier.dart';
import '../state/global_return_history_state.dart';

class GlobalReturnStateNotifier
    extends StateNotifier<GlobalReturnHistoryState> {
  GlobalReturnStateNotifier() : super(const GlobalReturnHistoryState.initial());

  void searchGobalReturnHistoryData(
      String query,
      List<Map<String, dynamic>> searchMyRequestHistoryList,
      List<Map<String, dynamic>> tempSearchMyRequestHistoryList) {
    if (query.isNotEmpty) {
      List<Map<String, dynamic>> foundProducts =
          searchProducts(tempSearchMyRequestHistoryList, query);
      state =
          GlobalReturnHistoryState.searchMyRequestHistoryValue(foundProducts);
    } else {
      state = GlobalReturnHistoryState.searchMyRequestHistoryValue(
          tempSearchMyRequestHistoryList);
    }
  }

  List<Map<String, dynamic>> searchProducts(
      List<Map<String, dynamic>> data, String searchValue) {
    List<Map<String, dynamic>> results = [];
    for (var entry in data) {
      entry.forEach((date, value) {
        Map<String, dynamic> valueMap = value as Map<String, dynamic>;
        Map<dynamic, dynamic> productLine = valueMap['product_line'];
        Map<String, dynamic> matchingProducts = {};
        productLine.forEach((key, productInfo) {
          if (key
              .toString()
              .toLowerCase()
              .startsWith(searchValue.toLowerCase())) {
            matchingProducts[key] =
                productInfo; // Add matching product line by key
          }

          for (var data in productInfo['products']) {
            if (data.productIdList[4]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()) ||
                data.productIdList[1]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()) ||
                data.productIdList[2]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase())) {
              matchingProducts[key] = productInfo;
              break;
            }
          }
        });

        if (matchingProducts.isNotEmpty) {
          results.add({
            date: {
              'id': valueMap['id'],
              'date': valueMap['date'],
              'product_line': matchingProducts,
            },
          });
        }
      });
    }
    return results;
  }
}
