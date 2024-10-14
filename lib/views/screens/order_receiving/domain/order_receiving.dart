class OrderReceiving {
  int id;
  String dateOrder;
  double amountTotal;
  double creditAmount;
  double netAmount;
  List orderProduct;
  String name;
  String invoiceNo;
  String deliveryNo;
  List<OrderReceivingProduct> productList;

  OrderReceiving({
    this.id = 0,
    this.dateOrder = "",
    this.amountTotal = 0.0,
    this.creditAmount = 0.0,
    this.netAmount = 0.0,
    this.orderProduct = const [],
    this.name = "",
    this.invoiceNo = "",
    this.deliveryNo = "",
    this.productList = const [],
  });

  factory OrderReceiving.fromJson(Map<String, dynamic> json) {
    List<OrderReceivingProduct> productList = [];
    if (json['product_line_ids'] != null) {
      for (var data in json['product_line_ids']) {
        productList.add(OrderReceivingProduct.fromJson(data));
      }
    }
    return OrderReceiving(
      id: json['id'],
      dateOrder: json['date_order'],
      amountTotal: json['amount_total'],
      creditAmount: json['amount_tax'],
      netAmount: json['amount_untaxed'],
      orderProduct: json['partner_id'],
      name: json['name'],
      invoiceNo: json['invoice_no'].toString(),
      deliveryNo: json['delivery_no'].toString(),
      productList: productList,
    );
  }
}

class OrderReceivingProduct {
  int id;
  List products;
  String defaultCode;
  double quantity;
  double price;
  String imageUrl;

  OrderReceivingProduct({
    this.id = 0,
    this.products = const [],
    this.defaultCode = "",
    this.quantity = 0.0,
    this.price = 0.0,
    this.imageUrl = "",
  });

  factory OrderReceivingProduct.fromJson(Map<String, dynamic> json) {
    return OrderReceivingProduct(
      id: json['id'],
      products: List.from(json['product_id']),
      defaultCode: json['code'],
      quantity: json['quantity'],
      price: json['price'],
      imageUrl: json['image_url'] == false ? "" : json['image_url'],
    );
  }
}
