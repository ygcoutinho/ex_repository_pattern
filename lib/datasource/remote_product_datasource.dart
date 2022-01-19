import 'package:dio/dio.dart';
import 'package:ex_repository_pattern/repositories/product_repository.dart';

class RemoteProductDatasource implements IProductRemoteDatasource {
  final Dio dio = Dio();
  Future<dynamic> getAllProducts() async {
    final response = await dio.get('http://localhost:3031/products');
    return response.data;
  }
}
