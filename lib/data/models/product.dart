class Product {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Rating rating;
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory Product.fromJsonToObject(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']));
  }
}

class Rating {
  dynamic rate;
  dynamic count;
  Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }
}
