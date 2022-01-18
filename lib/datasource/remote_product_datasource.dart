import 'package:dio/dio.dart';

class RemoteProductDatasource {
  final Dio dio = Dio();
  Future<dynamic> getAllProducts() async {
    final response = await dio.get('http://localhost:3031/products');
    return response.data;
  }
}
