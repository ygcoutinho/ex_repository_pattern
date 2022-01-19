import 'package:ex_repository_pattern/mockup_data/mockup_data.dart';
import 'package:ex_repository_pattern/repositories/product_repository.dart';

class LocalProductDatasource implements IProductLocalDatasource {
  final List<Map<String, String>> data = mockUpData['products']!;

  @override
  List<Map<String, String>> getAllProducts() {
    return data;
  }
}
