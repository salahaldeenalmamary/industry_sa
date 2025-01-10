import 'package:dio/dio.dart';

extension ResponseMapper<T> on Future<Response> {
  Future<T> mapResponseToEntity<T>(T Function(dynamic json) fromJson) async {
    try {
      final response = await this;

      if (response.statusCode == 200) {
        final dynamic data = response.data;

        if (data is Map<String, dynamic>) {
          return fromJson(data);
        } else if (data is List<dynamic>) {
          return fromJson(data.map((e) => e));
        }
      }


      throw Exception('Failed to map response to entity');
    } catch (e) {
      rethrow;
    }
  }
  
}
