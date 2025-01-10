import '../../core/model/ApiResponse.dart';
import '../models/common/appConfig.dart';
import '../models/homeApiResponse.dart';
import '../models/productAllApiResponse.dart';
import '../models/product_details_response.dart';

abstract class RemoteDataSource {


  Future<ApiResponse<HomeApiResponse>> getHomeDataApi();

 
  Future<ApiResponse<ProductAllApiResponse>> getAllProduct();
    Future<ApiResponse<AppConfig>> getAppConfig();
  
  
  Future<ApiResponse<ProductDetailsResponse>> getProductDetailsData(int productId);
}
