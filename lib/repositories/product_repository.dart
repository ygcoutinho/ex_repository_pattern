import 'package:ex_repository_pattern/datasource/local_product_datasource.dart';
import 'package:ex_repository_pattern/datasource/remote_product_datasource.dart';
import 'package:ex_repository_pattern/models/product_model.dart';

class ProductRepository {
  //final _dataSource = RemoteProductDatasource();
  final _dataSource = LocalProductDatasource();

  Future<List<ProductModel>> getAllProducts() async {
    List list = await _dataSource.getAllProducts();
    final products = list.map(ProductModel.fromJson).toList();
    return products;
  }
}
