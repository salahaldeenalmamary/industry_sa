import 'package:dio/dio.dart';
import '../data/local/my_shared_pref.dart';
import 'dio_provider.dart';

class DioRequestRetrier {
  final dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;

  

  DioRequestRetrier({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    var header = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
      final String accessToken =
        await MySharedPref.getToken()??'';
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
