class ProductData {
  int? id;
  String? title;
  var price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductData(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory ProductData.fromJson(dynamic json) {
    return ProductData(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:
          json['rating'] != null ? new Rating.fromJson(json['rating']) : null,
    );
  }
}

class Rating {
  var rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(dynamic json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
