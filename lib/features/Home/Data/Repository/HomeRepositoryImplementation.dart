import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  ApiConsumer apiConsumer;
  HomeRepositoryImplementation(this.apiConsumer);

  @override
  Future<ApiResult<List<String>>> getCategory() async {
    try {
      var data = await apiConsumer.get(
        ApiConstants.categoryListEndPoint,
      );
      return ApiResult.Success(List.from(data));
    } catch (e) {
      return ApiResult.Error('Error Loading $e');
    }
  }

  @override
  Future<ApiResult<ProductsResponse>> getNewArrivals() async {
    try {
      var data = await apiConsumer.get(ApiConstants.productEndPoint,
          QueryParameters: {"sortBy": "title", "order": "asc"});
      return ApiResult.Success(ProductsResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Error $e');
    }
  }

  @override
  Future<ApiResult<ProductsResponse>> getProductsOfCategory(
      String categoryName) async {
    try {
      var data = await apiConsumer
          .get('${ApiConstants.productOfCategory}/${categoryName}');
      return ApiResult.Success(ProductsResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Fail to get Data ${e.toString()}');
    }
  }
}
