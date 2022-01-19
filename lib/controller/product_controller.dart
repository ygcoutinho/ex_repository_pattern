import 'package:ex_repository_pattern/models/product_model.dart';
import 'package:flutter/foundation.dart';

//contrato
abstract class IProductRepository {
  Future<List<ProductModel>> getAllProducts();
}

class ProductController extends ChangeNotifier {
  //ProductController(this._repository);

  final IProductRepository _repository;
  List<ProductModel> products = [];

  ProductController({required IProductRepository repository}) : _repository = repository;

  Future<void> getProducts() async {
    products = await _repository.getAllProducts();
    //notificando a view
    notifyListeners();
  }
}
