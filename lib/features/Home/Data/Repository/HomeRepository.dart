import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';

abstract class HomeRepository {
  Future<ApiResult<List<String>>> getCategory();

  Future<ApiResult<ProductsResponse>> getNewArrivals();


}
