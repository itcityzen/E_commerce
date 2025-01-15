import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartResponse.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartProduct.dart';

abstract class CartRepository {

  Future<ApiResult<CartResponse>> getCart();
  Future<ApiResult<CartResponse>> addProduct(CartProduct addedProduct);
  Future<ApiResult<CartResponse>> updateProduct(int productID, int quantity);
  Future<ApiResult<CartResponse>> removeProduct(int productID);
  Future<void> deleteCart();
}
