import 'package:ex_repository_pattern/models/product_model.dart';
import 'package:ex_repository_pattern/repositories/product_repository.dart';
import 'package:flutter/foundation.dart';

class ProductController extends ChangeNotifier {
  final _repository = ProductRepository();
  List<ProductModel> products = [];

  Future<void> getProducts() async {
    products = await _repository.getAllProducts();
    notifyListeners();
  }
}
