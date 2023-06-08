import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modules/ProductData.dart';

class FetchDataApi {
  List<ProductData>? productData = [];
  Future<List<ProductData>> processData() async {
    var response = await http.get(Uri.parse(apiLink()));
    var jsonString = jsonDecode(response.body.toString());
    for (Map i in jsonString) {
      productData?.add(ProductData.fromJson(i));
    }
    return productData!;
  }

  String apiLink() {
    String uri = 'https://fakestoreapi.com/products/';
    return uri;
  }
}
