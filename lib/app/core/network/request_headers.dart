import 'package:dio/dio.dart';
import '../data/local/my_shared_pref.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Fetch headers asynchronously before proceeding
    getCustomHeaders().then((customHeaders) {
      // Add custom headers to the request options
      options.headers.addAll(customHeaders);
      // Call the handler to proceed with the request
      handler.next(options);
    }).catchError((error) {
      // Handle error case if custom headers fail to fetch
      handler.reject(DioError(
        requestOptions: options,
        error: error,
        type: DioErrorType.cancel,
      ));
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken = await MySharedPref.getToken() ?? '';
    final String lang = await MySharedPref.getCurrentLocal().languageCode ?? '';

    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }
    customHeaders.addAll({
      'lang': lang,
    });

    return customHeaders;
  }
}
