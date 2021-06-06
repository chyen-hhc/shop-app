import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Product.dart';

class Cart {
  GlobalKey key;
  final Product product;
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];
