class ProductModel {
  final String id, title;
  const ProductModel({required this.id, required this.title});

  //Transformando os dados recebidos em um modelo do produto (Factory)
  static ProductModel fromJson(dynamic json) {
    return ProductModel(id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
