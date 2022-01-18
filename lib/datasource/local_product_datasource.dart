import 'package:ex_repository_pattern/mockup_data/mockup_data.dart';

class LocalProductDatasource {
  final List<Map<String, String>> data = MockUpData['products']!;
  List<Map<String, String>> getAllProducts() {
    return data;
  }
}
