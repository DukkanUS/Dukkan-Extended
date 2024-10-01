class ReturnsRequest {
  int? orderId;
  List<Items>? items;

  ReturnsRequest({this.orderId, this.items});

  ReturnsRequest.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_id'] = orderId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? itemId;
  String? itemName;
  int? itemQty;
  double? itemPrice;
  String? returnReason;
  String? returnOptionalDetailedReason;
  String? image;

  Items({this.itemId, this.itemName, this.itemQty, this.itemPrice,this.returnReason, this.returnOptionalDetailedReason, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemQty = json['item_qty'];
    itemPrice = double.tryParse(json['item_price'].toString());
    returnReason = json['return_reason'];
    returnOptionalDetailedReason = json['return_optional_detailed_reason'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_qty'] = itemQty;
    data['item_price'] = itemPrice;
    data['return_reason'] = returnReason;
    data['return_optional_detailed_reason'] = returnOptionalDetailedReason;
    data['image'] = image;
    return data;
  }
}

class Returns {
  String? returnRequestId;
  String? orderId;
  List<Items>? items;
  String? status;

  Returns({this.returnRequestId, this.orderId, this.items,this.status});

  Returns.fromJson(Map<String, dynamic> json) {
    returnRequestId = json['return_request_id'].toString();
    orderId = json['order_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['return_request_id'] = returnRequestId;
    data['order_id'] = orderId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

