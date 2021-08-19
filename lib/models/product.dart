class Product {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  String brand;
  String productCategoryName;
  int quantity;
  bool isPopular;

  Product({this.id, this.title, this.description, this.price, this.imageUrl,
      this.brand, this.productCategoryName, this.quantity, this.isPopular});
}