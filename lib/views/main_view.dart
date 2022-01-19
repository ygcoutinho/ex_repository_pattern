import 'package:ex_repository_pattern/controller/product_controller.dart';
import 'package:ex_repository_pattern/datasource/local_product_datasource.dart';
import 'package:ex_repository_pattern/datasource/remote_product_datasource.dart';
import 'package:ex_repository_pattern/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _controller = ProductController(repository: ProductRepository(localDatasource: LocalProductDatasource(), remoteDatasource: RemoteProductDatasource()));

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
    _controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Repository Pattern'),
      ),
      body: ListView.builder(
        itemCount: _controller.products.length,
        itemBuilder: (_, index) {
          final product = _controller.products[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.id),
          );
        },
      ),
    );
  }
}
