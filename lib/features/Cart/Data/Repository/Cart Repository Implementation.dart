import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/core/cacheHelper/cacheHelper.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartResponse.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartProduct.dart';
import 'package:e_commerce/features/Cart/Data/Repository/Cart%20Repository.dart';

class CartRepositoryImplementation implements CartRepository {
  ApiConsumer apiConsumer;

  CartRepositoryImplementation(this.apiConsumer);

  int? userId = SharedPreferencesHelper.getId();

  @override
  Future<ApiResult<CartResponse>> addProduct(CartProduct addedProduct) async {
    try {
      var data = await apiConsumer
          .post('${ApiConstants.Cart}${ApiConstants.EndPointAddCart}', Body: {
        "userId": userId,
        "product": [
          {"id": addedProduct.id, "quantity": addedProduct.quantity}
        ]
      });

      return ApiResult.Success(CartResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Error to add product');
    }
  }

  @override
  Future<ApiResult<CartResponse>> deleteCart() async {
    try {
      var data = await apiConsumer.delete(ApiConstants.Cart);
      return ApiResult.Success(CartResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error("Can't Delete");
    }
  }

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    try {
      var data = await apiConsumer.get('${ApiConstants.Cart}/1');
      return ApiResult.Success(CartResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('No Cart');
    }
  }

  @override
  Future<ApiResult<CartResponse>> removeProduct(int productID) async {
    try {
      var data = await apiConsumer.put('${ApiConstants.Cart}/1', Body: {
        "merge": true,
        "product": [
          {"id": productID, "quantity": 0}
        ]
      });

      return ApiResult.Success(CartResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Error to add product');
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateProduct(
      int productID, int quantity) async {
    try {
      var data = await apiConsumer.put('${ApiConstants.Cart}/1', Body: {
        "merge": true,
        "product": [
          {"id": productID, "quantity": quantity}
        ]
      });

      return ApiResult.Success(CartResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Error to add product');
    }
  }
}
