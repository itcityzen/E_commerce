import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartResponse.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartProduct.dart';
import 'package:e_commerce/features/Cart/Data/Repository/Cart%20Repository.dart';

class LocalCartRepositoryImplementation implements CartRepository {
  final Map<int, CartProduct> allCartProducts = {};

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    double total = 0;
    double discountedTotal = 0;
    double totalquantity = 0;
    for (var eachProduct in allCartProducts.values) {
      total += eachProduct.price * eachProduct.quantity;
      discountedTotal += eachProduct.discountedTotal * eachProduct.quantity;
      totalquantity += eachProduct.quantity;
    }

    return ApiResult.Success(CartResponse(
        id: 1,
        products: allCartProducts.values.toList(),
        total: total,
        discountedTotal: discountedTotal,
        userId: 1,
        totalProducts: allCartProducts.length,
        totalQuantity: totalquantity.toInt()));
  }

  @override
  Future<ApiResult<CartResponse>> addProduct(CartProduct addedProduct) {
    if (allCartProducts.containsKey(addedProduct.id)) {
      allCartProducts[addedProduct.id]!.quantity += addedProduct.quantity;
    } else {
      allCartProducts[addedProduct.id] != addedProduct;
    }
    return getCart();
  }

  @override
  Future<ApiResult<CartResponse>> updateProduct(int productID, int quantity) {
    if (allCartProducts.containsKey(productID)) {
      if (quantity < 0) {
        allCartProducts[productID]!.quantity = quantity;
      } else {
        allCartProducts.remove(productID);
      }
    }
    return getCart();
  }

  @override
  Future<ApiResult<CartResponse>> removeProduct(int productID) {
    allCartProducts.remove(productID);
    return getCart();
  }

  @override
  Future<void> deleteCart() async {
    allCartProducts.clear();
  }
}
