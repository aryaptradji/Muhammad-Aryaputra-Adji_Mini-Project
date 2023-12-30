class ProductModel {
  final String name, price, imagePath;
  bool? isFav;

  ProductModel({
    required this.name,
    required this.price,
    required this.imagePath,
    this.isFav = false,
  });
}
