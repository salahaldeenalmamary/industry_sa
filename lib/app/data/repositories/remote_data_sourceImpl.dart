import 'package:appriverpod/app/core/data/local/my_shared_pref.dart';
import 'package:appriverpod/app/data/models/common/appConfig.dart';
import 'package:appriverpod/app/data/models/common/category.dart';
import 'package:dio/dio.dart';

import '../../../utils/ApiEndpoints.dart';
import '../../core/base/base_remote_source.dart';
import '../../core/model/ApiResponse.dart';
import 'remote_data_source.dart';
import '../models/homeApiResponse.dart';
import '../models/productAllApiResponse.dart';
import '../models/product_details_response.dart';

class RemoteDataSourceImpl extends BaseRemoteSource
    implements RemoteDataSource {
  @override
  Future<ApiResponse<HomeApiResponse>> getHomeDataApi() async {
    var dioCall = dioClient.get(ApiEndpoints.home);

    final response = await callApiWithErrorParser(dioCall);

    return ApiResponse<HomeApiResponse>.fromJson(response.data, (data) {
      return HomeApiResponse.fromJson(data);
    });
  }

  @override
  Future<ApiResponse<ProductAllApiResponse>> getAllProduct() async {
    var dioCall = dioClient.get(ApiEndpoints.allProducts);

    final response = await callApiWithErrorParser(dioCall);

    return ApiResponse<ProductAllApiResponse>.fromJson(
        response.data, (data) => ProductAllApiResponse.fromJson(data));
  }

  @override
  Future<ApiResponse<ProductDetailsResponse>> getProductDetailsData(
      int productId) async {
    var dioCall = dioClient.get(ApiEndpoints.productDetails(productId));

    final response = await callApiWithErrorParser(dioCall);

    return ApiResponse<ProductDetailsResponse>.fromJson(
        response.data, (data) => ProductDetailsResponse.fromJson(data));
  }

  @override
  Future<ApiResponse<AppConfig>> getAppConfig() async {
    var dioCall = dioClient
        .get(ApiEndpoints.common(MySharedPref.getCurrentLocal().languageCode));

    final response = await callApiWithErrorParser(dioCall);

    return ApiResponse<AppConfig>.fromJson(response.data, (data) {
      return AppConfig.fromJson(data);
    });
  }

  @override
Future<ApiResponse<List<Category>>> getCategories() async {
  try {
    // Construct the endpoint with the current language code
    var dioCall = dioClient.get(
        ApiEndpoints.categories(MySharedPref.getCurrentLocal().languageCode));

    // Await the API call
    final response = await callApiWithErrorParser(dioCall);

    // Extract and parse the 'data' field from the response
    final List<Category> categories = (response.data['data'] as List<dynamic>)
        .map((item) => Category.fromJson(item))
        .toList();

    return ApiResponse<List<Category>>(
      data: categories,
 
    );
  } catch (error) {
    // Handle any errors
    throw Exception('Failed to fetch categories: $error');
  }
}
    }
