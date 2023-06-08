class ProductsObject {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RattingsObject? rating;

  ProductsObject(this.id, this.title, this.price, this.description,
      this.category, this.image, this.rating);
}

class RattingsObject {
  double? rate;
  int? count;

  RattingsObject(this.rate, this.count);
}
