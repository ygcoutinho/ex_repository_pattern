import 'package:ex_repository_pattern/controller/product_controller.dart';
import 'package:ex_repository_pattern/datasource/local_product_datasource.dart';
import 'package:ex_repository_pattern/datasource/remote_product_datasource.dart';
import 'package:ex_repository_pattern/repositories/product_repository.dart';
import 'package:ex_repository_pattern/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  //Iniciar a instância do getIt
  final GetIt getIt = GetIt.instance;
  //Registrar o singleton
  getIt.registerFactory<IProductLocalDatasource>(() => LocalProductDatasource());
  getIt.registerFactory<IProductRemoteDatasource>(() => RemoteProductDatasource());
  getIt.registerFactory<IProductRepository>(() => ProductRepository(remoteDatasource: getIt.get(), localDatasource: getIt.get()));
  getIt.registerFactory(() => ProductController(repository: getIt.get()));

  //ProductController(repository: ProductRepository(localDatasource: LocalProductDatasource(), remoteDatasource: RemoteProductDatasource()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}
