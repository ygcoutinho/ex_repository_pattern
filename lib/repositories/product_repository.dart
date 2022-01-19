import 'dart:math';

import 'package:ex_repository_pattern/controller/product_controller.dart';
import 'package:ex_repository_pattern/models/product_model.dart';

abstract class IProductRemoteDatasource {
  Future<dynamic> getAllProducts();
}

abstract class IProductLocalDatasource {
  List<Map<String, String>> getAllProducts();
}

class ProductRepository implements IProductRepository {
  //final _dataSource = RemoteProductDatasource();
  //final _dataSource = LocalProductDatasource();
  final IProductRemoteDatasource _remoteDatasource;
  final IProductLocalDatasource _localDatasource;

  ProductRepository({
    required IProductRemoteDatasource remoteDatasource,
    required IProductLocalDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    late List list;

    if (Random().nextBool()) {
      list = await _remoteDatasource.getAllProducts();
      print('remote');
    } else {
      list = _localDatasource.getAllProducts();
      print('local');
    }
    print(list);
    final products = list.map(ProductModel.fromJson).toList();
    return products;
  }
}
