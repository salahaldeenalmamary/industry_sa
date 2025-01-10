
import 'package:dio/dio.dart';

import '../../../utils/BuildConfig.dart';
import '../network/dio_provider.dart';
import '../network/error_handlers.dart';
import '../network/exceptions/base_exception.dart';


abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  final logger = BuildConfig.instance.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;
      
      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
