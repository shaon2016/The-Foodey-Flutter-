class OrderRequest {
  String total;
  String orderTime;
  List<Products> products;

  OrderRequest({this.total, this.orderTime, this.products});

  OrderRequest.fromJson(Map<String, dynamic> json){
    total = json['total'].toString();
    orderTime = json['order_time'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['order_time'] = this.orderTime;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String id;
  String title;
  String price;
  String qty;

  Products({this.id, this.title, this.price, this.qty});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toString();
    qty = json['qty'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['qty'] = this.qty;
    return data;
  }
}