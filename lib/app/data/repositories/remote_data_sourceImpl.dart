import 'package:appriverpod/app/data/models/common/appConfig.dart';
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
    var dioCall = dioClient.get(ApiEndpoints.common);

    final response = await callApiWithErrorParser(dioCall);

    return ApiResponse<AppConfig>.fromJson(response.data, (data) {
      return AppConfig.fromJson(data);
    });
  }
}
