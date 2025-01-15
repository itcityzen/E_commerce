import 'CartProduct.dart';

class CartResponse {
  int id;
  List<CartProduct> products;
  double total;
  double discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  CartResponse({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      id: json['id'] ?? 0,
      products: (json['products'] as List?)
              ?.map((productJson) => CartProduct.fromJson(productJson))
              .toList() ??
          [],
      total: (json['total'] ?? 0.0).toDouble(),
      discountedTotal: (json['discountedTotal'] ?? 0.0).toDouble(),
      userId: json['userId'] ?? 0,
      totalProducts: json['totalProducts'] ?? 0,
      totalQuantity: json['totalQuantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((product) => product.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }
}
