class Product {
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final String image;

  Product({required this.title, required this.description, required this.price, required this.discountPercentage, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      image: json['thumbnail'],
    );
  }

  double get discountedPrice => price * (1 - discountPercentage / 100);
}
