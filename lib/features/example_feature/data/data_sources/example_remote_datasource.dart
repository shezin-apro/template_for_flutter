import 'package:dio/dio.dart';
import 'package:template_for_flutter/core/error/exceptions.dart';

import '../models/example_model.dart';

abstract class ExampleRemoteDataSource {
  /// Fetch example data from API
  Future<ExampleModel> getExampleData();
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final Dio dio;

  ExampleRemoteDataSourceImpl({required this.dio});

  @override
  Future<ExampleModel> getExampleData() async {
    // Just fetch data; no try/catch here
    final response = await dio.get('https://api.example.com/example');

    if (response.statusCode == 200) {
      return ExampleModel.fromJson(response.data);
    } else {
      throw ServerException('Error: ${response.statusCode}');
    }
  }
}
