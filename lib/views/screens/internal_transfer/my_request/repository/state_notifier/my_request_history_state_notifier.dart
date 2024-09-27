import 'package:state_notifier/state_notifier.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../state/my_request_history_state.dart';

class MyRequestHistoryStateNotifier
    extends StateNotifier<MyRequestHistoryState> {
  MyRequestHistoryStateNotifier()
      : super(const MyRequestHistoryState.initial());

  bool keyContainsQuery = false;
  void searchMyRequestHistoryData(
      String query,
      List<Map<String, dynamic>> searchMyRequestHistoryList,
      List<Map<String, dynamic>> tempSearchMyRequestHistoryList) {
    superPrint(searchMyRequestHistoryList);
    superPrint(tempSearchMyRequestHistoryList);

    // Clear previous search results
    keyContainsQuery = false;

    if (query.isNotEmpty) {
      List<Map<String, dynamic>> foundProducts =
          searchProducts(tempSearchMyRequestHistoryList, query);
      state = MyRequestHistoryState.searchMyRequestHistoryValue(foundProducts);
    } else {
      // If query is empty, return the original list
      state = MyRequestHistoryState.searchMyRequestHistoryValue(
          tempSearchMyRequestHistoryList);
    }
  }

  List<Map<String, dynamic>> searchProducts(
      List<Map<String, dynamic>> data, String searchValue) {
    List<Map<String, dynamic>> results = [];

    for (var entry in data) {
      entry.forEach((date, value) {
        // Ensure value is of type Map<String, dynamic>
        Map<String, dynamic> valueMap = value as Map<String, dynamic>;
        Map<dynamic, dynamic> productLine = valueMap['product_line'];

        // Create a map to hold matching products
        Map<String, dynamic> matchingProducts = {};

        // Iterate through product_line to find matches
        productLine.forEach((key, productInfo) {
          // Check if the product line key matches the search value
          if (key
              .toString()
              .toLowerCase()
              .startsWith(searchValue.toLowerCase())) {
            matchingProducts[key] =
                productInfo; // Add matching product line by key
          }

          // If the product info contains a list of products, check their names
          superPrint(productInfo['products']);
          // Assuming ProductLineId has a name property or similar
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

        // Only add to results if there are any matching products
        if (matchingProducts.isNotEmpty) {
          results.add({
            date: {
              'id': valueMap['id'],
              'date': valueMap['date'],
              'product_line':
                  matchingProducts, // Add all matching products together
            },
          });
        }
      });
    }
    return results; // Return results as a list of maps
  }
}
