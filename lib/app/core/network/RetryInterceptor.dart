import 'package:dio/dio.dart';

import '../data/local/preference/preference_manager.dart';
import 'dio_request_retrier.dart';

class RetryInterceptor extends Interceptor {
  final PreferenceManager _preferenceManager;

  RetryInterceptor(this._preferenceManager);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // Check if the error is due to an expired token
    if (err.response?.statusCode == 401) {
      try {
        // // Refresh the token
        // await refreshToken();

        // Retry the request
        final requestRetrier = DioRequestRetrier(requestOptions: err.requestOptions);
        final response = await requestRetrier.retry();

        return handler.resolve(response);
      } catch (e) {
       
        return handler.next(err);
      }
    }

    // If the error is not due to an expired token, pass it along
    handler.next(err);
  }
}
